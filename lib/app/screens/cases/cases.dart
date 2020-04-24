// Created by Christian Gerard E. Hizon on 4/24/20 2:22 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/24/20 2:22 PM
import 'package:covidstats/app/screens/cases/cases_content.dart';
import 'package:covidstats/app/shared/shared_bottom_appbar.dart';
import 'package:flutter/material.dart';

class CasesPage extends StatefulWidget {
  @override
  _CasesPageState createState() => _CasesPageState();
}

class _CasesPageState extends State<CasesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80.0), // here the desired height
          child: SharedBottomAppBar(),
        ),
        title: Text(
          'Negros Occidental',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      backgroundColor: Colors.white12,
      body: CasesContent(),
    );
  }
}
