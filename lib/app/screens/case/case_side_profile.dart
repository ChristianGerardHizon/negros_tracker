// Created by Christian Gerard E. Hizon on 4/24/20 4:51 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/24/20 4:43 PM

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaseSideProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(CupertinoIcons.profile_circled,
                size: 60, color: Colors.white30),
            SizedBox(height: 8),
            Text(
              'Male',
              style: TextStyle(
                  fontSize: 14, color: Colors.white30, letterSpacing: 1.2),
            ),
            SizedBox(height: 4),
            Text(
              '64 yr. old',
              style: TextStyle(fontSize: 18, letterSpacing: 1.2),
            ),
          ],
        ),
      ),
    );
  }
}
