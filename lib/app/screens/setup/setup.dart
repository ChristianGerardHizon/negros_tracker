/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 12:48 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 12:48 PM
 ******************************************************************************/

import 'package:covidstats/app/screens/tabs/tabs.dart';
/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/21/20 4:13 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/21/20 4:13 PM
 ******************************************************************************/

import 'package:covidstats/app/shared/negros_tracker.dart';
import 'package:covidstats/app/utils/image_assets.dart';
/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/21/20 10:39 AM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/21/20 10:39 AM
 ******************************************************************************/
import 'package:covidstats/app/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SetupPage extends StatelessWidget {
  static const String route = 'setup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30, top: 50),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        ImageAssets.logo,
                        scale: 3,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: NegrosTracker(),
                    ),
                  ],
                ),
              ),

              ///
              /// Content
              Expanded(
                flex: 7,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 50),
                  child: Text(
                    Strings.message,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              ///
              ///
              /// buttons
              Expanded(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.maxFinite,
                      child: FlatButton.icon(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              TabsPage.route, (route) => false);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.all(18),
                        color: Theme.of(context).primaryColor,
                        icon: Icon(FontAwesomeIcons.mapMarkerAlt),
                        label: Text(
                          'Enable Location',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: double.maxFinite,
                      child: FlatButton(
                        padding: EdgeInsets.all(18),
                        onPressed: () {},
                        child: Text(
                          'Manually choose location',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
