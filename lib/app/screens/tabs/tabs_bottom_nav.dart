// Created by Christian Gerard E. Hizon on 4/24/20 2:22 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/24/20 2:22 PM

import 'package:covidstats/app/blocs/blocs.dart';
/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/23/20 11:16 AM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/23/20 11:16 AM
 ******************************************************************************/
import 'package:covidstats/app/blocs/tabs/bloc.dart';
import 'package:covidstats/app/blocs/tabs/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabsBottomNavigation extends StatefulWidget {
  @override
  _TabsBottomNavigationState createState() => _TabsBottomNavigationState();
}

class _TabsBottomNavigationState extends State<TabsBottomNavigation> {
  TabsBloc _tabBloc;

  @override
  void initState() {
    _tabBloc = BlocProvider.of<TabsBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsBloc, TabsState>(
        builder: (BuildContext context, TabsState state) {
          return Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme
                  .of(context)
                  .scaffoldBackgroundColor,
            ),
            child: BottomNavigationBar(
              currentIndex: state.position,
              onTap: (i) => _tabBloc.add(TabChanged(position: i)),
              showUnselectedLabels: true,
              fixedColor: Theme
                  .of(context)
                  .primaryColor,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.tachometerAlt,
                    size: 22,
                  ),
                  title: Container(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      "Dashboard",
                    ),
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
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.profile_circled,
                    size: 20,
                  ),
                  title: Text(
                    "Cases",
                  ),
                ),
              ],
            ),
      );
    });
  }
}
