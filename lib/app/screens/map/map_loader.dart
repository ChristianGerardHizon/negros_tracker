// Created by Christian Gerard E. Hizon on 4/30/20 5:11 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/30/20 5:11 PM

import 'package:flutter/material.dart';

class MapLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          SizedBox(height: 15),
          Text('Updating Cases...'),
        ],
      ),
    );
  }
}
