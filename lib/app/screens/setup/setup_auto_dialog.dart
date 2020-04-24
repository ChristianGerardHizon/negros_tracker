// Created by Christian Gerard E. Hizon on 4/24/20 9:08 AM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/24/20 9:01 AM

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';

class SetupAutoLoadingDialog extends StatelessWidget {
  final Function onCancel;
  final Function(String) onError;
  final Function(Address, LocationData) onLocationFound;

  const SetupAutoLoadingDialog(
      {Key key, this.onCancel, this.onError, this.onLocationFound})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _initializeLocation() async {
      try {
        Location location = new Location();
        bool _serviceEnabled = await location.serviceEnabled();
        if (!_serviceEnabled) {
          _serviceEnabled = await location.requestService();
          if (!_serviceEnabled) {
            this.onError('Service not enabled');
            return;
          }
        }

        PermissionStatus _permissionGranted = await location.hasPermission();
        if (_permissionGranted == PermissionStatus.denied) {
          _permissionGranted = await location.requestPermission();
          if (_permissionGranted != PermissionStatus.granted) {
            this.onError('Permission not found');
            return;
          }
        }

        LocationData _locationData = await location.getLocation();

        final coordinates =
            new Coordinates(_locationData.latitude, _locationData.longitude);
        List<Address> addressList =
            await Geocoder.local.findAddressesFromCoordinates(coordinates);
        Address address = addressList.first;
        if (address == null) {
          this.onError('Address not found');
        }
        this.onLocationFound(address, _locationData);
      } catch (e) {
        this.onError(e.toString());
      }
    }

    return FutureBuilder(
        future: _initializeLocation(),
        builder: (context, snapshot) {
          return WillPopScope(
            onWillPop: () => Future.value(false),
            child: AlertDialog(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              content: Container(
                height: 300,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(FontAwesomeIcons.mapPin),
                          SizedBox(height: 20),
                          Text(
                            'Locating...',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 50,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        onPressed: this.onCancel,
                        color: Colors.black12,
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
