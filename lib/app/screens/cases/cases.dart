// Created by Christian Gerard E. Hizon on 4/27/20 12:26 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/27/20 12:25 PM
import 'package:covidstats/app/screens/cases/cases_content.dart';
import 'package:flutter/material.dart';

class CasesPage extends StatefulWidget {
  @override
  _CasesPageState createState() => _CasesPageState();
}

class _CasesPageState extends State<CasesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: CasesContent(),
    );
  }
}
