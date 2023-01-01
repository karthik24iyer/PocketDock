import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pocket_dock/util/data.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'AppTheme.dart';
import 'home/homepage.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'key1',
        channelName: 'Test',
        channelDescription: 'Test Notification',
        defaultColor: Colors.black,
        ledColor: Colors.yellow,
        playSound: true,
        enableLights: true,
        enableVibration: true,
        importance: NotificationImportance.High,
      )
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void writeToMem() {
    final mem = GetStorage();

    if(mem.read("pilot")!=true) {
      mem.write("Power_Bank", "Bag");
      mem.write("Kindle", "Desk");
      mem.write("Charger", "Study_Table");
      mem.write("Bottle", "Kitchen");
      mem.write("Keys", "Study_Drawer");
      mem.write("Earphone", "Next_to_TV");
      mem.write("Watch", "Bed_Drawer");
      mem.write("Mask", "Suitcase");
      for(int i=0; i< AppData.tagList.length; i++) {
        mem.write(AppData.tagList[i]+"_toggle",false);
      }
      mem.write("pilot",true);
    }
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    writeToMem();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    // return AdaptiveTheme(
    //   light: AppTheme().lightTheme,
    //   dark: AppTheme().darkTheme,
    //   initial: AdaptiveThemeMode.dark,
    //   builder: (theme, darkTheme) => MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     theme: theme,
    //     darkTheme: darkTheme,
    //     home: const HomePage(),
    //   ),
    // );
    return MaterialApp(
      theme: AppTheme().lightTheme,
      //darkTheme: AppTheme().darkTheme,
      home: const HomePage(),
    );
  }
}
