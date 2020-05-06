// Created by Christian Gerard E. Hizon on 5/6/20 6:09 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 5/6/20 6:09 PM
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidstats/app/models/case.dart';
import 'package:covidstats/app/utils/modifiers.dart';
import 'package:flutter/material.dart';

class CaseSideTimeline extends StatefulWidget {
  final Patient patient;

  const CaseSideTimeline({Key key, this.patient}) : super(key: key);

  @override
  _CaseSideTimelineState createState() => _CaseSideTimelineState();
}

class _CaseSideTimelineState extends State<CaseSideTimeline> {
  @override
  Widget build(BuildContext context) {
    Patient patient = this.widget.patient;
    return Expanded(
      flex: 2,
      child: Container(
        margin: EdgeInsets.only(left: 20, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: Modifiers.capitalize(patient.location),
              child: Container(
                child: Text(
                  Modifiers.capitalize(patient.location),
                  style: TextStyle(fontSize: 18, letterSpacing: 1.2),
                ),
              ),
            ),
            SizedBox(height: 20),
            StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance
                    .collection('dev-patients')
                    .document(patient.id)
                    .collection('timeline')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Something went wrong'),
                    );
                  }

                  if (!snapshot.hasData) {
                    return Center(
                      child: Text('No History Found'),
                    );
                  }

                  List<DocumentSnapshot> docs;
                  if (snapshot.hasData && snapshot.data != null) {
                    docs = snapshot.data.documents;
                  }

                  if (docs.length <= 0) {
                    return Container(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('No History Found'),
                        ],
                      ),
                    );
                  }

                  return Container(
                    height: 280,
                    child: ListView.builder(
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          var doc = docs[index];

                          bool isStart = doc.data['isStart'] ?? false;
                          bool isDead = doc.data['isDead'] ?? false;
                          bool isRecovered = doc.data['isRecovered'] ?? false;

                          String dateText = '';
                          String descText = '';
                          String colorSting = 'base';
                          Timestamp time = doc.data['date'];

                          if (time != null) {
                            DateTime date = time.toDate();
                            dateText = '${date.month}/${date.day}';
                          } else {
                            dateText = 'N/A ';
                          }

                          if (!isStart) {
                            var locations = doc.data['location'];
                            descText =
                            '${Modifiers.capitalize(locations ?? '')}';
                          } else {
                            descText =
                            '${Modifiers.capitalize(
                                doc.data['description'] ?? '')}';
                            colorSting = 'positive';
                          }

                          if (isRecovered) {
                            colorSting = 'recovered';
                          }

                          if (isDead) {
                            colorSting = 'dead';
                          }

                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  '$dateText - ',
                                  style: TextStyle(
                                      fontSize: 12, letterSpacing: 1.2),
                                ),
                                Text(
                                  descText,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Modifiers.coloPicker(colorSting),
                                    fontSize: 14,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  );
                })
          ],
        ),
      ),
    );
  }
}
