// Created by Christian Gerard E. Hizon on 4/28/20 5:05 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/28/20 5:04 PM

import 'dart:async';

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
  final _location = new Location();
  LocationData _currLoc;
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _bacolodCenter = CameraPosition(
    target: LatLng(10.683701, 122.956750),
    zoom: 10,
  );

  Set<Circle> _circles = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: BlocBuilder<SetupBloc, SetupState>(builder: (context, state) {
        if (state is SetupAutomaticLocationInitialized) {
          _currLoc = state.location;
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

              docs.forEach((doc) {
                var data = doc.data;

                double latitude = data['latitude'];
                double longitude = data['longitude'];
                int positiveCount = doc.data['total_positive'];

                if (latitude != null &&
                    longitude != null &&
                    positiveCount >= 1) {
                  double radius =
                  (250 + (positiveCount ?? 0 * 10)).roundToDouble();

                  _circles.add(
                    Circle(
                        circleId: CircleId(doc.documentID),
                        center: LatLng(latitude, longitude),
                        radius: radius,
                        strokeWidth: 3,
                        fillColor: Colors.red.withOpacity(.4),
                        strokeColor: Colors.redAccent,
                        consumeTapEvents: true,
                        onTap: () async {
                          CameraPosition _currPos = CameraPosition(
                            target: LatLng(latitude, longitude),
                            tilt: 59.440717697143555,
                            zoom: 13.151926040649414,
                          );
                          var controller = await _controller.future;
                          controller.animateCamera(
                              CameraUpdate.newCameraPosition(_currPos));
                        }),
                  );
                }
              });

              return GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _bacolodCenter,
                circles: _circles,
                onMapCreated: (GoogleMapController controller) async {
                  _controller.complete(controller);

                  // animated change camera to users location
                  if (_currLoc != null) {
                    await Future.delayed(
                        Duration(seconds: 1, milliseconds: 500));
                    CameraPosition _currPos = CameraPosition(
                      bearing: 192.8334901395799,
                      target: LatLng(_currLoc.latitude, _currLoc.longitude),
                      tilt: 59.440717697143555,
                      zoom: 13.151926040649414,
                    );
                    controller.animateCamera(
                        CameraUpdate.newCameraPosition(_currPos));
                  }
                },
              );
            });
      }),
    );
  }
}
