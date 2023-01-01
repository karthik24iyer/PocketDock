import 'dart:collection';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class ItemNotification extends StatefulWidget {
  ItemNotification({Key? key}) : super(key: key);

  @override
  State<ItemNotification> createState() => _ItemNotificationState();

  final mem = GetStorage();

  Future<void> createItemNotification(String item) async {
    String currentTimeZone = await AwesomeNotifications().getLocalTimeZoneIdentifier();
    mem.write(item+'_isNotificationEnabled', true);

    //default notificationInterval 4 hrs
    int notificationInterval = mem.read(item+'_scheduleTime') ?? 240;
    notificationInterval = 1;
    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: item.hashCode,
          channelKey: 'key1',
          title: item,
          body: 'Last kept: '+mem.read(item),
      ),
      // schedule: NotificationCalendar(
      //   minute: 0,
      //   second: 0,
      //   timeZone: currentTimeZone,
      //   repeats: false,
      // ),
      schedule: NotificationInterval(interval: 65, timeZone: currentTimeZone, repeats: true),
      actionButtons:
      [
        NotificationActionButton(key: 'Okay', label: 'Okay'),
        NotificationActionButton(key: 'Change', label: 'Change'),
      ]
    );
  }

  void cancelNotification(item) {
    AwesomeNotifications().cancelSchedule(item.hashCode);
    //AwesomeNotifications().cancelSchedule(1);
    mem.write(item+'_isNotificationEnabled', false);
    //AwesomeNotifications().cancelSchedule(1);
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
