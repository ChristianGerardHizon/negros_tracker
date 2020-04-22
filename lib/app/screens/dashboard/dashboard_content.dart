/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 12:48 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 12:47 PM
 ******************************************************************************/
import 'package:covidstats/app/screens/dashboard/dashboard_item.dart';
import 'package:covidstats/app/screens/dashboard/dashboard_item_alt_2.dart';
import 'package:covidstats/app/screens/dashboard/dashboard_item_alt_3.dart';
import 'package:covidstats/app/shared/negros_tracker_alt_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardContent extends StatefulWidget {
  @override
  _DashboardContentState createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Card(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Container(
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          DashboardItem(
                            color: Color(0xffFBD168),
                            title: 'Positives',
                            count: '10',
                            addedTodayCount: '126',
                          ),
                          DashboardItem(
                            color: Color(0xff37BC9B),
                            title: 'Recovered',
                            count: '2',
                            addedTodayCount: '12,126',
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      indent: 20,
                      endIndent: 20,
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        DashboardItemAlt2(
                          color: Color(0xffE65D6A),
                          title: 'Deaths',
                          count: '10',
                          addedTodayCount: '126',
                        ),
                      ],
                    ),
                    Divider(
                      indent: 20,
                      endIndent: 20,
                      height: 30,
                    ),
                    Container(
                      height: 120,
                      child: Row(
                        children: <Widget>[
                          DashboardItemAlt3(
                            color: Colors.grey,
                            title: 'Total PUI',
                            count: '2',
                          ),
                          VerticalDivider(),
                          DashboardItemAlt3(
                            color: Colors.grey,
                            title: 'Total PUM',
                            count: '100',
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      indent: 20,
                      endIndent: 20,
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Text('Data from DOH',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 10)),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              'As of 9:13am',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Transform.scale(
              scale: 0.7,
              child: NegrosTrackerAlt2(),
            )
          ],
        ),
      ),
    );
  }
}
