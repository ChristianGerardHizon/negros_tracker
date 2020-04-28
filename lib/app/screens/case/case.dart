// Created by Christian Gerard E. Hizon on 4/28/20 5:05 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/28/20 4:29 PM

import 'package:covidstats/app/models/case.dart';
import 'package:covidstats/app/screens/case/case_content.dart';
import 'package:covidstats/app/screens/cases/case_pills.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CasePageArgs {
  final Patient patient;

  CasePageArgs(this.patient);
}

class CasePage extends StatefulWidget {
  static const String route = 'case';

  final CasePageArgs args;

  const CasePage({Key key, this.args}) : super(key: key);

  @override
  _CasePageState createState() => _CasePageState();
}

class _CasePageState extends State<CasePage> {
  @override
  Widget build(BuildContext context) {
    Patient patient = this.widget.args.patient;

    _capitalize(String str) {
      return '${str[0].toUpperCase()}${str.substring(1)}';
    }

    _coloPicker(String status) {
      var yellow = Color(0xffFBD168);
      var green = Color(0xff37BC9B);
      var red = Colors.redAccent;
      var base = Colors.grey;

      switch (status) {
        case 'positive':
          return yellow;
        case 'recovered':
        case 'recover':
          return green;
        case 'expired':
        case 'dead':
          return red;
        default:
          return base;
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Container(
          width: 200,
          child: CasePills(
            title: _capitalize(patient.status),
            color: _coloPicker(patient.status.toLowerCase()),
            count: patient.name,
          ),
        ),
      ),
      body: CaseContent(
        patient: patient,
      ),
    );
  }
}
