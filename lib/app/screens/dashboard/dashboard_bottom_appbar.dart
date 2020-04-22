/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 12:48 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 12:48 PM
 ******************************************************************************/

import 'package:flutter/material.dart';

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
                child: Container(
                  child: Text(
                    'Bacolod City',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
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
