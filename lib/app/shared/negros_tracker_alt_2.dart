/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 12:48 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 12:48 PM
 ******************************************************************************/

import 'package:covidstats/app/utils/image_assets.dart';

/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 12:35 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/21/20 4:13 PM
 ******************************************************************************/
import 'package:flutter/material.dart';

class NegrosTrackerAlt2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  ImageAssets.logo,
                  scale: 4,
                ),
              ),
              SizedBox(width: 5),
              Text(
                'NO',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              Text(
                'Cov',
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).primaryColor),
              )
            ],
          ),
          Text(
            'by Stratium Software Group',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }
}
