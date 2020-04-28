// Created by Christian Gerard E. Hizon on 4/28/20 5:05 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/28/20 4:30 PM

import 'package:covidstats/app/models/case.dart';
import 'package:covidstats/app/screens/case/case_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaseContent extends StatelessWidget {
  final Patient patient;

  const CaseContent({Key key, this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // info
        CaseInfo(
          patient: patient,
        ),
        Divider(),
        // map

        //
      ],
    );
  }
}
