/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/23/20 11:45 AM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/23/20 11:45 AM
 ******************************************************************************/

import 'package:covidstats/app/blocs/tabs/bloc.dart';
import 'package:covidstats/app/blocs/tabs/state.dart';
import 'package:covidstats/app/screens/tabs/tabs_bottom_nav.dart';
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
    return BlocBuilder<TabsBloc, TabsState>(
      builder: (BuildContext context, TabsState state) {
        return Scaffold(
          body: state.currentTab,
          bottomNavigationBar: TabsBottomNavigation(),
        );
      },
    );
  }
}
