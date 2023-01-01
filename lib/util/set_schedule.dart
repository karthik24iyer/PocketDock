import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SetSchedule extends StatelessWidget {
  const SetSchedule({Key? key}) : super(key: key);

  String getScheduleTimeAsStr(String item) {
    final mem = GetStorage();

    int time = mem.read(item+'_scheduleTime') ?? 0;
    int hr=time~/60;
    switch(hr) {
      case 1: return "1H";
      case 2: return "2H";
      case 4: return "4H";
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

    return AlertDialog(
      backgroundColor: Colors.black45,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      actionsAlignment: MainAxisAlignment.center,

      // title: const Text(
      //   'Set Timer',
      //   style: TextStyle(fontSize: 24),
      // ),
      content: SizedBox(
        width: 250,
        height: 350,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                child: Text('1 hour', style: TextStyle(color: dialogTextColor)),
                onPressed: () {
                  mem.write(item+'_scheduleTime',60);
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('2 hours', style: TextStyle(color: dialogTextColor)),
                onPressed: () {
                  mem.write(item+'_scheduleTime',120);
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('4 hours', style: TextStyle(color: dialogTextColor)),
                onPressed: () {
                  mem.write(item+'_scheduleTime',240);
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('12 hours', style: TextStyle(color: dialogTextColor)),
                onPressed: () {
                  mem.write(item+'_scheduleTime',720);
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('1 day', style: TextStyle(color: dialogTextColor)),
                onPressed: () {
                  mem.write(item+'_scheduleTime',1440);
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('2 days', style: TextStyle(color: dialogTextColor)),
                onPressed: () {
                  mem.write(item+'_scheduleTime',1440*2);
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('7 days', style: TextStyle(color: dialogTextColor)),
                onPressed: () {
                  mem.write(item+'_scheduleTime',1440*7);
                  Navigator.of(context).pop();
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
        // TextButton(
        //   child: const Text('Set Timer'),
        //   onPressed: () {
        //     // Set the timer and close the dialog
        //     Navigator.of(context).pop();
        //   },
        // ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}