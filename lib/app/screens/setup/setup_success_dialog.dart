// Created by Christian Gerard E. Hizon on 4/24/20 9:08 AM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/24/20 9:01 AM

import 'package:covidstats/app/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SetupSuccessDialog extends StatelessWidget {
  final Function onManualSelect;
  final Function(SetupEvent) onConfirm;
  final SetupEvent event;
  final String city;

  const SetupSuccessDialog(
      {Key key, this.onManualSelect, this.onConfirm, this.event, this.city})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    Icon(
                      FontAwesomeIcons.mapPin,
                      color: Theme.of(context).primaryColor,
                      size: 50,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Located At',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      city ?? 'Not Found',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
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
                  onPressed: () => this.onConfirm(this.event),
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.maxFinite,
                height: 50,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onPressed: this.onManualSelect,
                  child: Text(
                    'Manually choose location',
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
