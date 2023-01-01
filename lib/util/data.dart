import 'dart:collection';

import 'package:flutter/material.dart';

class AppData extends StatelessWidget {
  const AppData({Key? key}) : super(key: key);

  static List<String> itemList = ["Power_Bank", "Bottle", "Charger",
    "Kindle", "Mask", "Keys", "Earphone", "Watch"];

  static List<String> placeList = ["Bag", "Bed_Drawer", "Cupboard",
    "Hall_Shelf", "TV_Stand", "Drawer", "Study_Table", "Hall_Table"];

  static Map<String,int> itemUID = {
    "Power_Bank":1,
    "Bottle":2,
    "Charger":3,
    "Kindle":4,
    "Mask":5,
    "Keys":6,
    "Earphone":7,
    "Watch":8,
  };

  static List<String> scheduleTimes = ["1H","2H","4H","6H","12H","1D","2D","7D"];

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
