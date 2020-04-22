/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 4:25 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 4:25 PM
 ******************************************************************************/

import 'package:covidstats/app/screens/map/map_pills.dart';
/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 3:34 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 3:34 PM
 ******************************************************************************/

import 'package:flutter/material.dart';

class MapBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      child: Column(
        children: <Widget>[
          /*

            Pills

           */
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: MapPills(
                  color: Color(0xffFBD168),
                  count: '143',
                  title: 'Positive',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: MapPills(
                  color: Color(0xff37BC9B),
                  count: '143',
                  title: 'Positive',
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          /*

            Stats


           */

          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  child: Text(
                    '289 Deaths',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.redAccent),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: Container(
                  child: Text(
                    '134 PUIs',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: Container(
                  child: Text(
                    '231 PUMs',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
