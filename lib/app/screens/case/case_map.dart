// Created by Christian Gerard E. Hizon on 4/30/20 5:11 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/30/20 5:11 PM

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidstats/app/models/case.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class CaseMap extends StatefulWidget {
  final Patient patient;

  const CaseMap({Key key, this.patient}) : super(key: key);

  @override
  _CaseMapState createState() => _CaseMapState();
}

class _CaseMapState extends State<CaseMap> {
  LocationData _currLoc;
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _bacolodCenter = CameraPosition(
    target: LatLng(10.683701, 122.956750),
    zoom: 10,
  );

  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance
            .collection('dev-patients')
            .document(widget.patient.id)
            .collection('timeline')
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
                  Text('Fetching Timeline...'),
                ],
              ),
            );
          }

          List<DocumentSnapshot> docs = snapshot.data.documents;

          _markers.clear();
          docs.forEach((doc) {
            var data = doc.data;

            var long = data['longitude'];
            var lat = data['latitude'];
            var description = data['description'] ?? 'no description';

            if (lat != null && long != null) {
              var location = LatLng(lat, long);

              var _markerId = MarkerId(doc.documentID.toString());

              final Marker marker = Marker(
                  markerId: _markerId,
                  position: location,
                  infoWindow: InfoWindow(title: description));
              _markers[_markerId] = marker;
            }
          });

          return GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _bacolodCenter,
            markers: Set<Marker>.of(_markers.values),
            trafficEnabled: false,
            mapToolbarEnabled: false,
            onMapCreated: (GoogleMapController controller) async {
              if (!_controller.isCompleted) _controller.complete(controller);
            },
          );
        },
      ),
    );
  }
}
