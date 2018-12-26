import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

class Splash extends StatefulWidget {
  final Widget navigateAfterSeconds;
  final int milliseconds;
  const Splash({Key key, this.navigateAfterSeconds, this.milliseconds})
      : super(key: key);
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    //load locale date format resource
    initializeDateFormatting("zh_CN", null);
    Timer(Duration(milliseconds: widget.milliseconds), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => widget.navigateAfterSeconds));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        ConstrainedBox(
          child: Image.asset(
            'assets/images/welcome_bg.jpg',
            fit: BoxFit.cover,
          ),
          constraints: BoxConstraints.expand(),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child:
                Center(child: Image.asset('assets/images/welcome_earth.png'))),
        Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/images/welcome_people.png')),
      ],
    );
  }
}
