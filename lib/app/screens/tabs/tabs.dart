/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 5:06 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 5:06 PM
 ******************************************************************************/

import 'package:covidstats/app/screens/provincial/provincial.dart';
import 'package:flutter/cupertino.dart';
/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/21/20 4:13 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/21/20 10:40 AM
 ******************************************************************************/

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabsPage extends StatelessWidget {
  static const String route = 'tabs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProvincialPage(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            title: Text(
              "Dashboard",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
            ),
            title: Text(
              "Map",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.mapPin,
              size: 20,
            ),
            title: Text(
              "Provincial",
            ),
          ),
        ],
      ),
    );
  }
}
