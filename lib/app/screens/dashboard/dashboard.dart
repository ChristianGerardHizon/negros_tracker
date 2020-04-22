/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 12:48 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 12:48 PM
 ******************************************************************************/

import 'package:covidstats/app/screens/dashboard/dashboard_content.dart';

/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/21/20 4:26 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/21/20 4:26 PM
 ******************************************************************************/
import 'package:covidstats/app/shared/negros_appbar.dart';
import 'package:flutter/material.dart';

import 'dashboard_bottom_appbar.dart';

class DashboardPage extends StatefulWidget {
  static const String route = 'dashboard';

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70.0), // here the desired height

          child: DashboardBottomAppBar(),
        ),
        title: NegrosAppBar(),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      backgroundColor: Colors.white12,
      body: DashboardContent(),
    );
  }
}
