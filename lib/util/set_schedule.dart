import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pocket_dock/util/data.dart';
import 'package:pocket_dock/util/item_notification.dart';

class SetSchedule extends StatelessWidget {
  const SetSchedule({Key? key}) : super(key: key);

  String getScheduleTimeAsStr(String item) {
    final mem = GetStorage();

    int time = mem.read(item+'_scheduleTime') ?? 0;
    int hr=time~/3600;
    switch(hr) {
      case 1: return "1H";
      case 2: return "2H";
      case 4: return "4H";
      case 6: return "6H";
      case 12: return "12H";
      case 24: return "1D";
      case 24*2: return "2D";
      case 24*7: return "7D";
      default: return "";
    }
  }

  Widget getScheduleOption(BuildContext context, String item) {
    final mem = GetStorage();
    Color dialogTextColor = Colors.white54;
    List<String> scheduleTimesText = List.filled(500,"",growable: true);
    Map<String,int> scheduleTimes = HashMap();
    for(int i=0;i<AppData.scheduleTimes.length;i++) {
      if(AppData.scheduleTimes[i].contains("H")) {
        if(AppData.scheduleTimes[i]=="1H") {
          scheduleTimesText[i] = "1 hour";
        }
        else {
          scheduleTimesText[i] = AppData.scheduleTimes[i].replaceAll("H", "") +" hour";
        }
        scheduleTimes.putIfAbsent(AppData.scheduleTimes[i], () => 60*60*int.parse(AppData.scheduleTimes[i].replaceAll("H", "")));
      }
      else if(AppData.scheduleTimes[i].contains("D")) {
        if(AppData.scheduleTimes[i]=="1D") {
          scheduleTimesText[i] = "1 day";
        }
        else {
          scheduleTimesText[i] = AppData.scheduleTimes[i].replaceAll("D", "") +" day";
        }
        scheduleTimes.putIfAbsent(AppData.scheduleTimes[i], () => 60*60*24*int.parse(AppData.scheduleTimes[i].replaceAll("D", "")));
      }
    }

    return AlertDialog(
      backgroundColor: Colors.black45,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      actionsAlignment: MainAxisAlignment.center,
      content: SizedBox(
        width: 250,
        height: 400,
        child: SingleChildScrollView(
          child: Column(
            textBaseline: TextBaseline.ideographic,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              for(int i=0;i<AppData.scheduleTimes.length;i++)
                TextButton(
                  child: Text(scheduleTimesText[i], style: TextStyle(color: dialogTextColor)),
                  onPressed: () {
                    mem.write(item+'_scheduleTime',scheduleTimes[AppData.scheduleTimes[i]]);
                    Navigator.of(context).pop();
                    if(mem.read(item+"_toggle")==true) {
                      ItemNotification().createItemNotification(item);
                    }
                  },
                ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel', style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}