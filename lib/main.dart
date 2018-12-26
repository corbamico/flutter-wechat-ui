import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'ui/mainpage.dart';
import 'ui/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      position: ToastPosition.bottom,
      radius: 8.0,
      backgroundColor: Colors.black54,
      textStyle: TextStyle(fontSize: 12.0),
      child: MaterialApp(
        //title: "微信",
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Splash(milliseconds: 2000, navigateAfterSeconds: MainPage()),
      ),
    );
  }
}
