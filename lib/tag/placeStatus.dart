import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pocket_dock/util/item_notification.dart';

import '../util/data.dart';

class PlaceStatus extends StatefulWidget {

  final tag;
  const PlaceStatus({Key? key, required this.tag}) : super(key: key);

  @override
  State<PlaceStatus> createState() => _PlaceStatusState();
}

class _PlaceStatusState extends State<PlaceStatus> {

  Color tagTextColor = Colors.white;
  //String currentPlace = "";

  Widget getTagContainer(String place) {
    final mem = GetStorage();

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white70,width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(
              15.0)
          ),
          color: Colors.black54
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () {
              mem.write(widget.tag, place);
              Navigator.pop(context);
              mem.read(widget.tag+'_isNotificationEnabled')==true?ItemNotification().createItemNotification(widget.tag):{};
            },
            child: Text(
                place.replaceAll("_", " "),
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(color: tagTextColor, fontSize: 15)
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final mem = GetStorage();

    return GridView.count(
      physics: const AlwaysScrollableScrollPhysics(),
      primary: false,
      padding: const EdgeInsets.all(50),
      crossAxisSpacing: 25,
      mainAxisSpacing: 15,
      crossAxisCount: 2,
      children: <Widget>[
        for(int i=0; i< AppData.placeList.length; i++)
          getTagContainer(AppData.placeList[i]),
      ],
    );
  }

  Widget getTagContainerOld(String item) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white70,width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(
                15.0)
            ),
            color: Colors.black
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
                item.replaceAll("_", " "),
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(color: tagTextColor, fontSize: 20)
            ),
          ],
        ),
      ),
      onTap: () {
        //widget.currentPlace = item;
      },
    );
  }
}
