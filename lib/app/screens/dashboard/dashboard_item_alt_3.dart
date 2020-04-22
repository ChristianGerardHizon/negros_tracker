/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 12:48 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 12:29 PM
 ******************************************************************************/

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardItemAlt3 extends StatelessWidget {
  final Color color;
  final String title;
  final String count;

  const DashboardItemAlt3({Key key, this.color, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              this.count,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: color,
                fontSize: 45,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            Text(
              this.title,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
