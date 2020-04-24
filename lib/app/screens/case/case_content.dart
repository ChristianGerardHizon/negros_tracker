// Created by Christian Gerard E. Hizon on 4/24/20 4:51 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/24/20 4:50 PM

import 'package:covidstats/app/screens/case/case_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaseContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // info
        CaseInfo(),
        Divider(),
        // map

        //
      ],
    );
  }
}
