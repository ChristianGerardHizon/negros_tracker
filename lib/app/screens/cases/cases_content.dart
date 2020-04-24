// Created by Christian Gerard E. Hizon on 4/24/20 2:22 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/24/20 1:09 PM

import 'package:covidstats/app/screens/cases/cases_tile.dart';
import 'package:flutter/material.dart';

class CasesContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        /*

          Content

         */
        CasesTile(
          status: 'Positive',
          color: Colors.yellowAccent,
          title: 'Bacolod City',
        ),
      ],
    ));
  }
}
