// Created by Christian Gerard E. Hizon on 4/24/20 4:51 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/24/20 4:40 PM

import 'package:covidstats/app/screens/case/case_content.dart';
import 'package:covidstats/app/screens/cases/case_pills.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CasePage extends StatefulWidget {
  static const String route = 'case';

  @override
  _CasePageState createState() => _CasePageState();
}

class _CasePageState extends State<CasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Container(
          width: 200,
          child: CasePills(
            title: 'Expired',
            color: Colors.redAccent,
            count: 'NP#1',
          ),
        ),
      ),
      body: CaseContent(),
    );
  }
}
