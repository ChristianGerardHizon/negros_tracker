/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 5:58 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 5:57 PM
 ******************************************************************************/

import 'package:covidstats/app/screens/provincial/provincial_tile.dart';
import 'package:flutter/material.dart';

class ProvincialContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        /*

                Content

               */
        ProvincialTile(
          title: 'Bacolod City',
        ),
        ProvincialTile(
          title: 'Talisay City',
        ),
        ProvincialTile(
          title: 'Silay City',
        ),
        ProvincialTile(
          title: 'Cadiz City',
        )
      ],
    ));
  }
}
