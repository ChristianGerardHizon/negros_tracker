// Created by Christian Gerard E. Hizon on 4/24/20 9:08 AM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/24/20 9:07 AM

import 'package:flutter/material.dart';

class SetupCityDropDown extends StatefulWidget {
  final Function(String) onSelect;

  const SetupCityDropDown({Key key, this.onSelect}) : super(key: key);

  @override
  _SetupCityDropDownState createState() => _SetupCityDropDownState();
}

class _SetupCityDropDownState extends State<SetupCityDropDown> {
  final List<String> cityList = [
    'Bacolod',
    'Bago City',
    'Binalbagan',
    'Cadiz City',
    'Calatrava',
    'Candoni',
    'Cauayan',
    'Enrique B. Magalona',
    'Escalante City',
    'Himamaylan City',
    'Hinigaran',
    'Hinoba-an',
    'Ilog',
    'Isabela',
    'Kabankalan',
    'La Carlota City',
    'La Castellana',
    'Manapla',
    'Moises Padilla',
    'Murcia',
    'Pontevedra',
    'Pulupandan',
    'Sagay City',
    'Salvador Benedicto',
    'San Carlos City',
    'San Enrique',
    'Silay City',
    'Sipalay',
    'Talisay City',
    'Toboso',
    'Valladolid',
    'Victorias City'
  ];

  String selectedCity = 'Bacolod';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: new BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.25),
          border: new Border.all(
              color: Theme.of(context).primaryColor.withOpacity(0.75)),
          borderRadius: new BorderRadius.all(const Radius.circular(20.0))),
      child: DropdownButtonHideUnderline(
        child: new DropdownButton<String>(
          value: selectedCity,
          isExpanded: true,
          items: cityList.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: (str) {
            setState(() {
              selectedCity = str;
            });
            this.widget.onSelect(selectedCity);
          },
        ),
      ),
    );
  }
}
