import 'package:flutter/material.dart';

class TagIcon extends StatelessWidget {
  const TagIcon({Key? key}) : super(key: key);

  Widget getIcon(String item) {
    Color iconColor = Colors.white70;

    switch(item) {

      case("Power_Bank") : return Icon(Icons.add_box_sharp, color: iconColor);
      case("Bottle") : return Icon(Icons.water_drop, color: iconColor);
      case("Charger") : return Icon(Icons.charging_station, color: iconColor);
      case("Book") : return Icon(Icons.book_outlined, color: iconColor);
      case("Kindle") : return Icon(Icons.book_outlined, color: iconColor);
      case("Tablet") : return Icon(Icons.tablet_android, color: iconColor);
      case("Mask") : return Icon(Icons.masks, color: iconColor);
      case("Keys") : return Icon(Icons.key_sharp, color: iconColor);
      case("Earphone") : return Icon(Icons.music_note_outlined, color: iconColor);
      case("Watch") : return Icon(Icons.watch, color: iconColor);
      case("Select") : return Icon(Icons.expand_circle_down_outlined, color: iconColor);

      default : return Icon(Icons.star, color: iconColor);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
