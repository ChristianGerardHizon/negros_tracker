// Created by Christian Gerard E. Hizon on 4/24/20 2:22 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/24/20 2:22 PM

import 'package:covidstats/app/screens/cases/case_pills.dart';
import 'package:flutter/material.dart';

class CasesTile extends StatelessWidget {
  final String title;
  final Color color;
  final String gender;
  final String age;
  final String status;
  final String id;

  const CasesTile(
      {Key key,
      this.title,
      this.color = Colors.white,
      this.gender,
      this.age,
      this.status,
      this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: FlatButton(
          onPressed: () {},
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
                        width: 180,
                        child: CasePills(
                          title: status,
                          count: 'NP#2',
                          color: color,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        this.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(height: 70, child: VerticalDivider()),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Male',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color: Colors.white54),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '59 yr. old',
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
