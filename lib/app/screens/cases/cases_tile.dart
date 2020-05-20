// Created by Christian Gerard E. Hizon on 5/6/20 6:09 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 5/6/20 6:09 PM

import 'package:covidstats/app/models/case.dart';
import 'package:covidstats/app/screens/case/case.dart';
import 'package:covidstats/app/screens/cases/case_pills.dart';
import 'package:covidstats/app/utils/modifiers.dart';
import 'package:flutter/material.dart';

class CasesTile extends StatelessWidget {
  final String location;
  final Color color;
  final String gender;
  final String age;
  final String status;
  final String id;
  final String title;
  final Patient patient;

  const CasesTile({
    Key key,
    this.location,
    this.color = Colors.white,
    this.gender,
    this.age,
    this.status,
    this.id,
    this.title,
    this.patient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: FlatButton(
          onPressed: () =>
              Navigator.pushNamed(context, CasePage.route,
                  arguments: CasePageArgs(this.patient)),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 35,
                        width: 180,
                        child: CasePills(
                          title: status,
                          count: this.title,
                          color: color,
                        ),
                      ),
                      SizedBox(height: 10),
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          this.location,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 70,
                    child: VerticalDivider(
                      width: 50,
                    )),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '$gender',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color: Colors.white54),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '$age yr. old',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
