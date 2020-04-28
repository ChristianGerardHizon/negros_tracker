// Created by Christian Gerard E. Hizon on 4/28/20 5:05 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/28/20 4:32 PM

import 'package:covidstats/app/models/case.dart';
import 'package:covidstats/app/utils/modifiers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaseSideProfile extends StatelessWidget {
  final Patient patient;

  const CaseSideProfile({Key key, this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(CupertinoIcons.profile_circled,
                size: 60, color: Colors.white30),
            SizedBox(height: 8),
            Text(
              Modifiers.capitalize(patient.gender),
              style: TextStyle(
                  fontSize: 14, color: Colors.white30, letterSpacing: 1.2),
            ),
            SizedBox(height: 4),
            Text(
              '${patient.age} yr. old',
              style: TextStyle(fontSize: 18, letterSpacing: 1.2),
            ),
          ],
        ),
      ),
    );
  }
}
