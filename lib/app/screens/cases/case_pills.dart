// Created by Christian Gerard E. Hizon on 5/6/20 6:09 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 5/6/20 6:09 PM

import 'package:flutter/material.dart';

class CasePills extends StatelessWidget {
  final Color color;
  final String count;
  final String title;

  const CasePills({Key key, this.color, this.count, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: color,
        border: Border.all(color: color),
        borderRadius: new BorderRadius.all(
          const Radius.circular(8.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: new BoxDecoration(
                color: Theme
                    .of(context)
                    .scaffoldBackgroundColor,
                border: Border.all(color: color),
                borderRadius: new BorderRadius.all(const Radius.circular(6.0)),
              ),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  this.count,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Text(
              this.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
