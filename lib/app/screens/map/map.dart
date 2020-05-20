// Created by Christian Gerard E. Hizon on 4/30/20 5:23 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/30/20 5:23 PM

import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidstats/app/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LocationData _currLoc;
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _bacolodCenter = CameraPosition(
    target: LatLng(10.683701, 122.956750),
    zoom: 10,
  );

  Set<Circle> _circles = Set();

  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  CameraPosition _currPos;

  _addMarker(LatLng location, String id) async {
    var _markerId = MarkerId(id);

    final Uint8List markerIcon = await getBytesFromCanvas(60, 60, '20');

    final Marker marker = Marker(
      markerId: _markerId,
      position: location,
      icon: BitmapDescriptor.fromBytes(markerIcon),
    );
    _markers[_markerId] = marker;
  }

  _addCityMarkers() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: BlocBuilder<SetupBloc, SetupState>(builder: (context, state) {
        if (state is SetupAutomaticLocationInitialized) {
          _currLoc = state.location;
        }

        if (_currLoc != null) {
          var _location = LatLng(_currLoc.latitude, _currLoc.longitude);

          var _markerId = MarkerId(_currLoc.toString());

          final Marker marker = Marker(
              markerId: _markerId,
              position: _location,
              onTap: () async {
                var controller = await _controller.future;
                controller
                    .animateCamera(CameraUpdate.newCameraPosition(_currPos));
              });

          _markers[_markerId] = marker;

          _currPos = CameraPosition(
            bearing: 18.8334901395799,
            target: _location,
            tilt: 59.440717697143555,
            zoom: 14.151926040649414,
          );
        }

        return FutureBuilder<QuerySnapshot>(
            future: Firestore.instance
                .collection('dev-cases')
                .document('summary')
                .collection('city-breakdown')
                .getDocuments(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Container(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      SizedBox(height: 15),
                      Text('Fetching Cases'),
                    ],
                  ),
                );
              }

              List<DocumentSnapshot> docs = snapshot.data.documents;

              _circles.clear();
              docs.forEach((doc) {
                var data = doc.data;

                double latitude = data['latitude'];
                double longitude = data['longitude'];
                int positiveCount = doc.data['total_positive'];

                if (latitude != null &&
                    longitude != null &&
                    positiveCount >= 1) {
                  double radius = (500 + (positiveCount * 100)).roundToDouble();

                  if (radius > 3000) {
                    radius = 3000;
                  }

                  var loc = LatLng(latitude, longitude);
                  _circles.add(
                    Circle(
                        circleId: CircleId(doc.documentID),
                        center: loc,
                        radius: radius,
                        strokeWidth: 3,
                        fillColor: Colors.red.withOpacity(.4),
                        strokeColor: Colors.redAccent,
                        consumeTapEvents: true,
                        onTap: () async {
                          CameraPosition _currPos = CameraPosition(
                            target: LatLng(latitude, longitude),
                            tilt: 10.440717697143555,
                            zoom: 13.151926040649414,
                          );
                          var controller = await _controller.future;

                          if (_currPos != null) {
                            controller.animateCamera(
                                CameraUpdate.newCameraPosition(_currPos));
                          }
                        }),
                  );
                }
              });

              return GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _bacolodCenter,
                circles: _circles,
                markers: Set<Marker>.of(_markers.values),
                trafficEnabled: false,
                mapToolbarEnabled: false,
                onMapCreated: (GoogleMapController controller) async {
                  if (!_controller.isCompleted) {
                    _controller.complete(controller);
                  }

                  // animated change camera to users location
                  if (_currLoc != null) {
                    await Future.delayed(
                        Duration(seconds: 1, milliseconds: 500));

                    controller.animateCamera(
                        CameraUpdate.newCameraPosition(_currPos));
                  }
                },
              );
            });
      }),
    );
  }

  Future<Uint8List> getBytesFromCanvas(int width, int height,
      String number) async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()
      ..color = Colors.redAccent;
    final Radius radius = Radius.circular(width / 2);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        paint);

    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      text: number,
      style: TextStyle(fontSize: 30.0, color: Colors.white),
    );

    painter.layout();
    painter.paint(
        canvas,
        Offset((width * 0.5) - painter.width * 0.5,
            (height * .5) - painter.height * 0.5));
    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ImageByteFormat.png);
    return data.buffer.asUint8List();
  }
}
