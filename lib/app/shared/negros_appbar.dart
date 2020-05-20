/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 12:48 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/21/20 5:04 PM
 ******************************************************************************/
import 'package:covidstats/app/utils/image_assets.dart';
import 'package:flutter/material.dart';

class NegrosAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Image.asset(
              ImageAssets.logo,
              scale: 5,
            ),
          ),
          SizedBox(width: 10),
          Text(
            'NOCov',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Tracker',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).primaryColor),
          )
        ],
      ),
    );
  }
}
