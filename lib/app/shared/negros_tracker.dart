/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/21/20 4:13 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/21/20 4:13 PM
 ******************************************************************************/
import 'package:flutter/material.dart';

class NegrosTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'NOCov',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              Text(
                'Tracker',
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
