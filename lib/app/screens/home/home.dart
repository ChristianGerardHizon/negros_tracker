/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/20/20 2:03 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/20/20 1:09 PM
 ******************************************************************************/

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String route = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
    );
  }
}
