// Created by Christian Gerard E. Hizon on 5/6/20 7:10 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 5/6/20 7:10 PM

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidstats/app/blocs/blocs.dart';
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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DashboardContent extends StatefulWidget {
  @override
  _DashboardContentState createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  @override
  Widget build(BuildContext context) {
    _buildCity(SetupState state) {
      String address = 'summary';
      if (state is SetupManualLocationInitialized) {
        address = state.address;
      }
      if (state is SetupAutomaticLocationInitialized) {
        address = state.address.locality;
      }
      return address.replaceAll(' ', '-').toLowerCase();
    }

    return BlocBuilder<SetupBloc, SetupState>(builder: (context, state) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              StreamBuilder<DocumentSnapshot>(
                  stream: Firestore.instance
                      .collection('dev-cases')
                      .document('summary')
                      .collection('city-breakdown')
                      .document(_buildCity(state))
                      .snapshots(),
                  builder: (context, snapshot) {
                    String overallDeaths = '0';
                    String overallPui = '0';
                    String overallPum = '0';
                    String overallPositive = '0';
                    String overallRecoveries = '0';

                    if (snapshot.hasData &&
                        snapshot.data != null &&
                        snapshot.data.exists) {
                      DocumentSnapshot snap = snapshot.data;
                      overallDeaths = snap.data['total_deaths'].toString();
                      overallPui = snap.data['total_pui'].toString();
                      overallPum = snap.data['total_pum'].toString();
                      overallPositive = snap.data['total_positive'].toString();
                      overallRecoveries =
                          snap.data['total_recoveries'].toString();
                    }

                    var date = new DateTime.now();
                    int day = date.day;
                    int month = date.month;
                    int year = date.year;

                    String dateString =
                        '$year-${month.toString().padLeft(2, '0')}-${day
                        .toString().padLeft(2, '0')}';

                    return StreamBuilder<DocumentSnapshot>(
                        stream: Firestore.instance
                            .collection('dev-cases')
                            .document(dateString)
                            .collection('city-breakdown')
                            .document(_buildCity(state))
                            .snapshots(),
                        builder: (context, snapshotCity) {
                          String deathsToday = '0';
                          String positiveToday = '0';
                          String recoveriesToday = '0';
                          String lastUpdated;
                          String source;

                          if (snapshotCity.hasData &&
                              snapshotCity.data != null &&
                              snapshotCity.data.exists) {
                            DocumentSnapshot citySnap = snapshotCity.data;


                            source = citySnap.data['source'];
                            deathsToday =
                                citySnap.data['total_deaths'].toString();
                            positiveToday =
                                citySnap.data['total_positive'].toString();
                            recoveriesToday =
                                citySnap.data['total_recoveries'].toString();
                            Timestamp timestamp = citySnap.data['last_updated'];

                            if (timestamp != null) {
                              var date = DateTime.fromMillisecondsSinceEpoch(
                                  timestamp.millisecondsSinceEpoch);
                              lastUpdated =
                                  new DateFormat('hh:mm a').format(date);
                            }
                          }

                          return Card(
                            color: Theme
                                .of(context)
                                .scaffoldBackgroundColor,
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
                                          count: positiveToday,
                                          addedTodayCount: overallPositive,
                                        ),
                                        DashboardItem(
                                          color: Color(0xff37BC9B),
                                          title: 'Recovered',
                                          count: recoveriesToday,
                                          addedTodayCount: overallRecoveries,
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
                                        count: deathsToday,
                                        addedTodayCount: overallDeaths,
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
                                          count: overallPui,
                                        ),
                                        VerticalDivider(),
                                        DashboardItemAlt3(
                                          color: Colors.grey,
                                          title: 'Total PUM',
                                          count: overallPum,
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
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                              source != null
                                                  ? 'From $source'
                                                  : '',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10)),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            lastUpdated != null
                                                ? 'As of $lastUpdated'
                                                : '',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }),
              SizedBox(height: 15),
              Transform.scale(
                scale: 0.7,
                child: NegrosTrackerAlt2(),
              )
            ],
          ),
        ),
      );
    });
  }
}
