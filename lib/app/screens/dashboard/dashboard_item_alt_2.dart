// Created by Christian Gerard E. Hizon on 4/30/20 5:11 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/30/20 10:52 AM

import 'package:flutter/material.dart';

class DashboardItemAlt2 extends StatelessWidget {
  final Color color;
  final String title;
  final String count;
  final String addedTodayCount;

  const DashboardItemAlt2(
      {Key key, this.color, this.title, this.count, this.addedTodayCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                this.title,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              height: 150,
              child: Container(
                width: double.maxFinite,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            this.count,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: color,
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      decoration: new BoxDecoration(
                        color: color,
                        borderRadius:
                            new BorderRadius.all(const Radius.circular(6)),
                      ),
                      child: Text(
                        'Added Today',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).scaffoldBackgroundColor),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 15),
                  Text(
                    this.addedTodayCount,
                    style: TextStyle(
                      fontSize: 24,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                  Text(
                    'Overall Total',
                    style: TextStyle(
                      letterSpacing: 1.4,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
