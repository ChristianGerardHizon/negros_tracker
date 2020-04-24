// Created by Christian Gerard E. Hizon on 4/24/20 4:51 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/24/20 4:50 PM

import 'package:covidstats/app/screens/case/case_side_profile.dart';
import 'package:covidstats/app/screens/case/case_side_timeline.dart';
import 'package:flutter/material.dart';

class CaseInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 300),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CaseSideTimeline(),
              Container(
                  height: 300,
                  child: VerticalDivider(
                    indent: 20,
                    endIndent: 20,
                  )),
              CaseSideProfile()
            ],
          ),
          Text(
            'Source: Bacolod City Health Office',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
