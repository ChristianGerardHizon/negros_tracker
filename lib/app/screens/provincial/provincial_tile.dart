// Created by Christian Gerard E. Hizon on 4/27/20 3:13 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/27/20 3:13 PM

import 'package:covidstats/app/shared/map_pills.dart';
/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 5:02 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 5:02 PM
 ******************************************************************************/
import 'package:flutter/material.dart';

import 'provincial_stat.dart';

class ProvincialTile extends StatelessWidget {
  final String title;
  final String positive;
  final String recoveries;
  final String deaths;
  final String puis;
  final String pums;
  final String subtitle;

  const ProvincialTile({Key key,
    this.title,
    this.positive,
    this.recoveries,
    this.deaths,
    this.puis,
    this.pums,
    this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Card(
        color: Theme
            .of(context)
            .scaffoldBackgroundColor,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                this.title,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: MapPills(
                            title: 'Positive',
                            count: this.positive ?? '0',
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          flex: 1,
                          child: MapPills(
                            title: 'Recoveries',
                            count: this.recoveries ?? '0',
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: <Widget>[
                        ProvincialStats(
                          count: this.deaths ?? '0',
                          title: 'Deaths',
                        ),
                        ProvincialStats(
                          count: this.puis ?? '0',
                          title: 'PUIs',
                        ),
                        ProvincialStats(
                          count: this.pums ?? '0',
                          title: 'PUMs',
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    this.subtitle != null
                        ? Container(
                      width: double.maxFinite,
                      child: Text(
                        this.subtitle,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFBD168),
                        ),
                      ),
                    )
                        : Container(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
