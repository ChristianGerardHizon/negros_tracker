// Created by Christian Gerard E. Hizon on 4/28/20 5:05 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/28/20 5:04 PM

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidstats/app/models/case.dart';
import 'package:covidstats/app/screens/cases/cases_tile.dart';
import 'package:flutter/material.dart';

class CasesContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('dev-patients').snapshots(),
      builder: (context, snapshot) {
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
                Text('No Cases Found'),
              ],
            ),
          );
        }

        return Container(
          child: ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              var doc = docs[index];
              Patient patient = Patient.fromMap(doc.data, doc.documentID);

              _capitalize(String str) {
                return '${str[0].toUpperCase()}${str.substring(1)}';
              }

              _coloPicker(String status) {
                var yellow = Color(0xffFBD168);
                var green = Color(0xff37BC9B);
                var red = Colors.redAccent;
                var base = Colors.grey;

                switch (status) {
                  case 'positive':
                    return yellow;
                  case 'recovered':
                  case 'recover':
                    return green;
                  case 'expired':
                  case 'dead':
                    return red;
                  default:
                    return base;
                }
              }

              return CasesTile(
                title: patient.name.toUpperCase(),
                status: _capitalize(patient.status),
                color: _coloPicker(patient.status.toLowerCase()),
                location: _capitalize(patient.location),
                age: patient.age.toString(),
                id: doc.documentID,
                gender: _capitalize(patient.gender),
                patient: patient,
              );
            },
          ),
        );
      },
    );
  }
}
