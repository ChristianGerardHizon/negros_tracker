// Created by Christian Gerard E. Hizon on 4/27/20 3:13 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/27/20 3:13 PM

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidstats/app/blocs/blocs.dart';
import 'package:covidstats/app/screens/provincial/provincial_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProvincialContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetupBloc, SetupState>(
      builder: (context, state) {
        return Container(
            child: FutureBuilder<QuerySnapshot>(
              future: Firestore.instance
                  .collection('dev-cases')
                  .document('summary')
                  .collection('city-breakdown')
                  .getDocuments(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Container(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(height: 15),
                        Text('Fetching Provincial Cases'),
                      ],
                    ),
                  );
                }

                if (snapshot.hasError) {
                  return Container(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Failed to fetch Provincial Cases'),
                      ],
                    ),
                  );
                }

                List<DocumentSnapshot> docs = snapshot.data.documents;

                if (docs != null && docs.length <= 0) {
                  return Container(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('No Provincial Cases Found'),
                      ],
                    ),
                  );
                }


                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, int) {
                    DocumentSnapshot doc = docs[int];
                    String city = doc.data['city'] ?? 'NOT_FOUND';
                    String cityPropercase =
                        "${city[0].toUpperCase()}${city.substring(1)}";

                    String overallDeaths = '0';
                    String overallPui = '0';
                    String overallPum = '0';
                    String overallPositive = '0';
                    String overallRecoveries = '0';

                    overallDeaths = doc.data['total_deaths'].toString();
                    overallPui = doc.data['total_pui'].toString();
                    overallPum = doc.data['total_pum'].toString();
                    overallPositive = doc.data['total_positive'].toString();
                    overallRecoveries = doc.data['total_recoveries'].toString();

                    return ProvincialTile(
                      title: cityPropercase,
                      deaths: overallDeaths,
                      positive: overallPositive,
                      puis: overallPui,
                      pums: overallPum,
                      recoveries: overallRecoveries,
                    );
                  },
                );
              },
            ));
      },
    );
  }
}
