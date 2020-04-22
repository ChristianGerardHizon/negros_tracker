/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 5:06 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 5:06 PM
 ******************************************************************************/
import 'package:covidstats/app/screens/provincial/provincial_content.dart';
import 'package:covidstats/app/shared/map_bottom_appbar.dart';
import 'package:flutter/material.dart';

class ProvincialPage extends StatefulWidget {
  @override
  _ProvincialPageState createState() => _ProvincialPageState();
}

class _ProvincialPageState extends State<ProvincialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80.0), // here the desired height
          child: MapBottomAppBar(),
        ),
        title: Text(
          'Negros Occidental', style: TextStyle(fontWeight: FontWeight.w700),),
        elevation: 0,
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
      ),
      backgroundColor: Colors.white12,
      body: ProvincialContent(),
    );
  }
}
