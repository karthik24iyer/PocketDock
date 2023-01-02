import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import '../tag/item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();

}

class _HomePage extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) => {
      if(!isAllowed) {
        showDialog(
          context: context,
          builder: (context) =>
            AlertDialog(
              title: const Text('Allow Notifications', style: TextStyle(color: Colors.white70)),
              content: const Text('Our app would like to send you notifications', style: TextStyle(color: Colors.white70)),
              backgroundColor: Colors.black,
              actions: [
                TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Don\'t allow',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 18,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: (){
                    AwesomeNotifications().requestPermissionToSendNotifications()
                        .then((_) => Navigator.pop(context));
                  },
                  child: const Text(
                    'Allow',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
        )
      }
    });

  }

  @override
  Widget build(BuildContext context) {

    bool isDark=true;

    return DefaultTabController (
      length: 4,
      child: Scaffold(
        //backgroundColor: Colors.black87,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: Colors.black,
          elevation: 0,
          // flexibleSpace: Container(
          //   decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topCenter,
          //       end: Alignment.bottomCenter,
          //       colors: [Colors.black, Colors.black],
          //     ),
          //   ),
          // ),
          //backgroundColor: Colors.black,
          title: const TabBar(
            labelColor: Colors.white54,
            indicatorColor: Colors.white54 ,
            labelPadding: EdgeInsets.all(1),
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Tags"),
              Tab(icon: Icon(Icons.search), text: "Log"),
              Tab(icon: Icon(Icons.settings), text: "Settings"),
              Tab(icon: Icon(Icons.account_circle), text: "Account")
            ],
          ),
        ),
        body: Container(
          //color: Colors.black54,
          color: Colors.black54.withOpacity(0.65),
          child: TabBarView(
            children: [
              const Item(),
              workInProgress(),
              workInProgress(),
              workInProgress(),
            ],
          ),
        )
      ),
    );
  }

  Widget workInProgress() {
    return const Tab(
        icon: Icon(Icons.settings, color: Colors.black, size: 40),
        child: Text(
            "Work In Progress",
            textAlign: TextAlign.center,
            softWrap: true,
            style: TextStyle(color: Colors.black, fontSize: 30)
        )
    );
  }
}