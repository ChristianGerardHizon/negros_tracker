// Created by Christian Gerard E. Hizon on 4/24/20 4:51 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/24/20 4:47 PM
import 'package:flutter/material.dart';

class CaseSideTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                'La Castellana',
                style: TextStyle(fontSize: 18, letterSpacing: 1.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
