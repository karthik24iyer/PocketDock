import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pocket_dock/tag/itemStatus.dart';
import 'package:pocket_dock/tag/placeStatus.dart';
import 'package:pocket_dock/util/item_notification.dart';
import 'package:pocket_dock/util/set_schedule.dart';

import '../util/TagIcon.dart';
import '../util/data.dart';

class Item extends StatefulWidget {
  const Item({Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {

  static const Color textColor = Colors.white70;
  static const Color iconColor = Colors.white70;
  TagIcon tagIcon = const TagIcon();
  bool displayFront = true;

  // @override
  // void initState() {
  //   super.initState();
  //   _loadCounter();
  // }

  Widget getTagContainer(String item) {

    final mem = GetStorage();
    String place="Empty";

    if(mem.read(item)!=null) {
      place = mem.read(item);
    }

    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 15.0,
            spreadRadius: 5.0,
            offset: Offset(0.0, 7.0),
          ),
        ],
      ),

      //padding: const EdgeInsets.only(left: 3, right: 3),
      //padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                //style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white10)),
                onPressed: () {
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      item.replaceAll("_", " "),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: const TextStyle(color: textColor, fontSize: 20)
                    ),
                    const SizedBox(width: 10),
                    tagIcon.getIcon(item),
                  ],
                )
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                //style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white10)),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        backgroundColor: Colors.black54,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 16,
                        //insetPadding: const EdgeInsets.all(20),
                        child: SizedBox(
                          height: 500,
                          child: PlaceStatus(tag: item),
                        ),
                      );
                    },
                  ).then((_)=>setState((){}));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      place.replaceAll("_", " "),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: const TextStyle(color: textColor, fontSize: 20)
                    ),
                    //const SizedBox(width: 10),
                    //tagIcon.getIcon(place),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Switch(
                inactiveTrackColor: Colors.black,
                activeColor: Colors.white,
                //activeThumbImage: const AssetImage('images/toggle_icon.png'),
                value: mem.read(item+"_toggle"),
                onChanged: (value) {
                  setState(() {
                    mem.write(item+"_toggle",value);
                    if(mem.read(item+"_toggle")==true) {
                      ItemNotification().createItemNotification(item);
                    }
                    else {
                      ItemNotification().cancelNotification(item);
                    }
                  });
                },
              ),
              // IconButton(
              //   onPressed: () {
              //     showDialog(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return const SetSchedule().getScheduleOption(context, item);
              //       },
              //     ).then((_)=>setState((){}));
              //   },
              //   icon: const Icon(Icons.timelapse_outlined, color: iconColor),
              // ),
              TextButton(
                child:
                const SetSchedule().getScheduleTimeAsStr(item)!=""?
                Text(
                    const SetSchedule().getScheduleTimeAsStr(item),
                    style: const TextStyle(
                      color: Colors.white54,
                    ),
                  ):
                const Icon(Icons.timelapse_outlined, color: iconColor),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const SetSchedule().getScheduleOption(context, item);
                    },
                  ).then((_)=>setState((){}));
                },
              ),
            ],
          )
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {

    return GridView.count(
      physics: const AlwaysScrollableScrollPhysics(),
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 15,
      crossAxisCount: 2,
      children: <Widget>[
        for(int i=0; i< AppData.tagList.length; i++)
          getTagContainer(AppData.tagList[i]),
        ],
    );
  }
}
