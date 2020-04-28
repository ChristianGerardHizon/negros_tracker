// Created by Christian Gerard E. Hizon on 4/28/20 5:05 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/28/20 5:04 PM
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
            Container(
              child: Text(
                Modifiers.capitalize(patient.location),
                style: TextStyle(fontSize: 18, letterSpacing: 1.2),
              ),
            ),
            SizedBox(height: 10),
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

                  if (docs == null) {
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

                          Timestamp time = doc.data['date'];
                          var locations = doc.data['location'];

                          DateTime date = time.toDate();


                          return Container(
                            child: Text(
                              '${date.month}/${date.day} - ${Modifiers
                                  .capitalize(doc.data['location'] ?? '')}',
                              style:
                              TextStyle(fontSize: 13, letterSpacing: 1.2),
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
