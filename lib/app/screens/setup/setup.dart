// Created by Christian Gerard E. Hizon on 4/27/20 4:15 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/27/20 4:07 PM

import 'package:covidstats/app/blocs/blocs.dart';
import 'package:covidstats/app/models/location.dart';
import 'package:covidstats/app/screens/setup/setup_auto_dialog.dart';
import 'package:covidstats/app/screens/setup/setup_success_dialog.dart';
import 'package:covidstats/app/screens/tabs/tabs.dart';
import 'package:covidstats/app/shared/negros_tracker.dart';
import 'package:covidstats/app/utils/image_assets.dart';
import 'package:covidstats/app/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';

import 'setup_manual_dialog.dart';

class SetupPage extends StatelessWidget {
  static const String route = 'setup';

  @override
  Widget build(BuildContext context) {
    final _setupBloc = BlocProvider.of<SetupBloc>(context);

    _successModal(BuildContext context, SetupEvent event) {
      Navigator.popUntil(context, (route) => route.isFirst);

      String city;

      if (event is SetAutomaticLocation) {
        city = event.address.locality;
      } else if (event is SetManualLocation) {
        city = event.address;
      }

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return SetupSuccessDialog(
            city: city,
            event: event,
            onConfirm: (event) {
              _setupBloc.add(event);
              Navigator.pushNamedAndRemoveUntil(
                context,
                TabsPage.route,
                    (route) => false,
              );
            },
            onManualSelect: () {
              Navigator.popUntil(context, (route) => route.isFirst);
              _setupBloc.add(LocationEnabled(LocationTypes.manual));
            },
          );
        },
      );
    }

    _handleOnAutoLocation(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return SetupAutoLoadingDialog(
            onCancel: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            onError: (error) {},
            onLocationFound: (Address address, LocationData location) {
              _successModal(context,
                  SetAutomaticLocation(address: address, location: location));
            },
          );
        },
      );
    }

    _handleOnManualLocation(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return SetupManualDialog(
            onCancel: () =>
                Navigator.popUntil(context, (route) => route.isFirst),
            onError: (error) {},
            onLocationFound: (String address) {
              _successModal(context, SetManualLocation(address: address));
            },
          );
        },
      );
    }

    return Scaffold(
      body: BlocListener<SetupBloc, SetupState>(
        listener: (context, state) async {
          if (state is SetupLocationAllowed) {
            switch (state.type) {
              case LocationTypes.automatic:
                _handleOnAutoLocation(context);
                break;
              case LocationTypes.manual:
                _handleOnManualLocation(context);
                break;
            }
          }
        },
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 50),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          ImageAssets.logo,
                          scale: 3,
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: NegrosTracker(),
                      ),
                    ],
                  ),
                ),

                ///
                /// Content
                Expanded(
                  flex: 7,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 50),
                    child: Text(
                      Strings.message,
                      style:
                      TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                ///
                ///
                /// buttons
                Expanded(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.maxFinite,
                        child: FlatButton.icon(
                          onPressed: () =>
                              _setupBloc
                                  .add(
                                  LocationEnabled(LocationTypes.automatic)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.all(18),
                          color: Theme
                              .of(context)
                              .primaryColor,
                          icon: Icon(FontAwesomeIcons.mapMarkerAlt),
                          label: Text(
                            'Use Location',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: double.maxFinite,
                        child: FlatButton(
                          padding: EdgeInsets.all(18),
                          onPressed: () =>
                              _setupBloc
                                  .add(LocationEnabled(LocationTypes.manual)),
                          child: Text(
                            'Manually choose location',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
