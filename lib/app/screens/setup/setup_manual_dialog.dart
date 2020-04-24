// Created by Christian Gerard E. Hizon on 4/24/20 9:08 AM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/24/20 9:08 AM

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'setup_city_dropdown.dart';

class SetupManualDialog extends StatefulWidget {
  final Function onCancel;
  final Function(String) onError;
  final Function(String) onLocationFound;

  const SetupManualDialog(
      {Key key, this.onCancel, this.onError, this.onLocationFound})
      : super(key: key);

  @override
  _SetupManualDialogState createState() => _SetupManualDialogState();
}

class _SetupManualDialogState extends State<SetupManualDialog> {
  String selectedCity = 'Bacolod';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      content: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Container(
          height: 300,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Choose location',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        Container(
                            child: Icon(
                          FontAwesomeIcons.mapPin,
                          color: Theme.of(context).primaryColor,
                          size: 40,
                        ))
                      ],
                    ),
                    SizedBox(height: 50),
                    SetupCityDropDown(
                      onSelect: (city) {
                        setState(() {
                          selectedCity = city;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 50,
                child: FlatButton(
                  onPressed: () => this.widget.onLocationFound(selectedCity),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.maxFinite,
                height: 30,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onPressed: this.widget.onCancel,
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Colors.grey),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
