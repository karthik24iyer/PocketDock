import 'dart:collection';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pocket_dock/util/data.dart';

class ItemNotification extends StatefulWidget {
  ItemNotification({Key? key}) : super(key: key);

  @override
  State<ItemNotification> createState() => _ItemNotificationState();

  final mem = GetStorage();

  Future<void> createItemNotification(String item) async {
    String currentTimeZone = await AwesomeNotifications().getLocalTimeZoneIdentifier();
    mem.write(item+'_isNotificationEnabled', true);

    //default notificationInterval 6 hrs
    int notificationInterval = mem.read(item+'_scheduleTime') ?? 360;
    //notificationInterval = 1;
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: AppData.itemUID[item] ?? 0,
        channelKey: 'key1',
        title: item,
        body: 'Last kept: '+mem.read(item),
        fullScreenIntent: true,
        wakeUpScreen: true,
        category: NotificationCategory.Reminder,
      ),
      // schedule: NotificationCalendar(
      //   minute: 0,
      //   second: 0,
      //   timeZone: currentTimeZone,
      //   repeats: false,
      // ),
      schedule: NotificationInterval(interval: notificationInterval, timeZone: currentTimeZone, repeats: false),
      actionButtons:
      [
        NotificationActionButton(key: 'Okay', label: 'Okay', actionType: ActionType.DismissAction),
        NotificationActionButton(key: 'Change', label: 'Change'),
      ]
    );
  }

  void cancelNotification(item) {
    AwesomeNotifications().cancelSchedule(AppData.itemUID[item]??0);
    //AwesomeNotifications().cancelSchedule(1);
    mem.write(item+'_isNotificationEnabled', false);
  }

  int createUniqueId() {
    return DateTime.now().millisecondsSinceEpoch.remainder(100000);
  }
}

class _ItemNotificationState extends State<ItemNotification> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
