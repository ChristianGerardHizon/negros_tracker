/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 5:39 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 5:38 PM
 ******************************************************************************/

import 'dart:async';

/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 5:06 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 4:31 PM
 ******************************************************************************/

import 'package:covidstats/app/shared/map_bottom_appbar.dart';
/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/21/20 4:13 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/21/20 4:13 PM
 ******************************************************************************/

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {


  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80.0), // here the desired height
          child: MapBottomAppBar(),
        ),
        title: Text(
          'Negros Occidental', style: TextStyle(fontWeight: FontWeight.w700),),
        elevation: 0,
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
      ),
      backgroundColor: Colors.white12,
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
