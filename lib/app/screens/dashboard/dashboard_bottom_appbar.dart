// Created by Christian Gerard E. Hizon on 4/24/20 9:24 AM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/24/20 9:24 AM

import 'package:covidstats/app/blocs/blocs.dart';
/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 12:48 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 12:48 PM
 ******************************************************************************/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(thickness: 1),
          Row(
            children: <Widget>[
              Expanded(
                child: BlocBuilder<SetupBloc, SetupState>(
                    builder: (context, state) {
                      String city;
                      if (state is SetupManualLocationInitialized) {
                        city = state.address;
                      }

                      if (state is SetupAutomaticLocationInitialized) {
                        city = state.address.locality;
                      }

                      return Container(
                        child: Text(
                          city ?? 'Not Found',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }),
              ),
              Container(
                child: FlatButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.grey)),
                  child: Text('Change'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
