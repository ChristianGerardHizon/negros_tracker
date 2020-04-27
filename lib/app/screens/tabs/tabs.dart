// Created by Christian Gerard E. Hizon on 4/27/20 12:26 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/27/20 12:25 PM

import 'package:covidstats/app/blocs/tabs/bloc.dart';
import 'package:covidstats/app/blocs/tabs/state.dart';
import 'package:covidstats/app/screens/tabs/tabs_bottom_nav.dart';
import 'package:covidstats/app/shared/shared_bottom_appbar.dart';
import 'package:flutter/cupertino.dart';
/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/21/20 4:13 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/21/20 10:40 AM
 ******************************************************************************/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabsPage extends StatelessWidget {
  static const String route = 'tabs';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TabsBloc>(
      create: (context) => TabsBloc(),
      child: BlocBuilder<TabsBloc, TabsState>(
        builder: (BuildContext context, TabsState state) {
          return Scaffold(
            appBar: PreferredSize(
              // hides app bar when on dashboard
              preferredSize: Size.fromHeight(state.position == 0 ? 0 : 130),
              child: AppBar(
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(80.0),
                  // here the desired height
                  child: SharedBottomAppBar(),
                ),
                title: Text(
                  'Negros Occidental',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                elevation: 0,
                backgroundColor: Theme
                    .of(context)
                    .scaffoldBackgroundColor,
              ),
            ),
            body: state.currentTab,
            bottomNavigationBar: TabsBottomNavigation(),
          );
        },
      ),
    );
  }
}
