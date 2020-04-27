// Created by Christian Gerard E. Hizon on 4/27/20 4:15 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/27/20 4:15 PM

import 'package:flutter/material.dart';

class DashboardItem extends StatelessWidget {
  final Color color;
  final String title;
  final String count;
  final String addedTodayCount;

  const DashboardItem(
      {Key key, this.color, this.title, this.count, this.addedTodayCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _fontSizeCounter(String str) {
      if (str.length <= 2) {
        return 80;
      } else if (str.length == 3) {
        return 50;
      } else {
        return 20;
      }
    }

    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              this.title,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 150,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.maxFinite,
                      decoration: new BoxDecoration(
                        border: Border.all(color: color),
                        borderRadius: new BorderRadius.all(
                          const Radius.circular(8.0),
                        ),
                      ),
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
                                    fontSize: _fontSizeCounter(this.count),
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.all(4),
                            decoration: new BoxDecoration(
                              color: color,
                              borderRadius: new BorderRadius.only(
                                bottomLeft: const Radius.circular(6),
                                bottomRight: const Radius.circular(6),
                              ),
                            ),
                            child: Text(
                              'Added Today',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
