// Created by Christian Gerard E. Hizon on 4/27/20 12:26 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/27/20 12:25 PM

import 'package:covidstats/app/screens/provincial/provincial_content.dart';
import 'package:flutter/material.dart';

class ProvincialPage extends StatefulWidget {
  @override
  _ProvincialPageState createState() => _ProvincialPageState();
}

class _ProvincialPageState extends State<ProvincialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: ProvincialContent(),
    );
  }
}
