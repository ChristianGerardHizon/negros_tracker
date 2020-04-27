// Created by Christian Gerard E. Hizon on 4/27/20 1:27 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/27/20 1:27 PM

import 'dart:async';

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
    zoom: 8.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: BlocBuilder<SetupBloc, SetupState>(builder: (context, state) {
        if (state is SetupAutomaticLocationInitialized) {
          _currLoc = state.location;
        }

        return GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _bacolodCenter,
          onMapCreated: (GoogleMapController controller) async {
            _controller.complete(controller);

            // animated change camera to users location
            if (_currLoc != null) {
              await Future.delayed(Duration(seconds: 1, milliseconds: 500));
              CameraPosition _currPos = CameraPosition(
                bearing: 192.8334901395799,
                target: LatLng(_currLoc.latitude, _currLoc.longitude),
                tilt: 59.440717697143555,
                zoom: 13.151926040649414,
              );
              controller
                  .animateCamera(CameraUpdate.newCameraPosition(_currPos));
            }
          },
        );
      }),
    );
  }
}
