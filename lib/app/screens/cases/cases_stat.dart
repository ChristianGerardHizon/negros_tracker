// Created by Christian Gerard E. Hizon on 4/24/20 2:22 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/24/20 10:50 AM

import 'package:flutter/material.dart';

class CasesStats extends StatelessWidget {
  final String count;
  final String title;

  const CasesStats({Key key, this.count, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Row(
          children: <Widget>[
            Text(
              this.count,
              style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(width: 5),
            Text(
              this.title,
              style: TextStyle(
                letterSpacing: 1,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
