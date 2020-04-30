// Created by Christian Gerard E. Hizon on 4/30/20 5:11 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/30/20 4:22 PM

import 'dart:async';

import 'package:covidstats/app/models/case.dart';
import 'package:covidstats/app/screens/case/case_info.dart';
import 'package:covidstats/app/screens/case/case_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CaseContent extends StatefulWidget {
  final Patient patient;

  const CaseContent({Key key, this.patient}) : super(key: key);

  @override
  _CaseContentState createState() => _CaseContentState();
}

class _CaseContentState extends State<CaseContent> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _bacolodCenter = CameraPosition(
    target: LatLng(10.683701, 122.956750),
    zoom: 13,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // info
        CaseInfo(
          patient: widget.patient,
        ),
        Divider(),
        // map

        Expanded(
          flex: 1,
          child: CaseMap(
            patient: widget.patient,
          ),
        )

        //
      ],
    );
  }
}
