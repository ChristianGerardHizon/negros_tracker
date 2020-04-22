/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 5:34 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 5:34 PM
 ******************************************************************************/

import 'package:covidstats/app/blocs/tabs/bloc.dart';
import 'package:covidstats/app/blocs/tabs/events.dart';
import 'package:covidstats/app/blocs/tabs/state.dart';
import 'package:covidstats/app/screens/dashboard/dashboard.dart';
import 'package:covidstats/app/screens/map/map.dart';
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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabsPage extends StatelessWidget {
  static const String route = 'tabs';

  @override
  Widget build(BuildContext context) {
    final TabsBloc _tabBloc = BlocProvider.of<TabsBloc>(context);

    return Scaffold(
      body: BlocBuilder<TabsBloc, TabsState>(
        builder: (BuildContext context, TabsState state) {
          debugPrint(state.position.toString());

          if (state.position == 0) {
            return DashboardPage();
          } else if (state.position == 1) {
            return MapPage();
          } else if (state.position == 2) {
            return ProvincialPage();
          } else {
            return Container(child: Text('Not Found'));
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) => _tabBloc.add(TabChanged(position: i)),
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
