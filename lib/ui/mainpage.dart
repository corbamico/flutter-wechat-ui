import 'package:flutter/material.dart';

import 'chat/main.dart';
import 'contact/main.dart';
import 'find/main.dart';
import 'me/main.dart';

class MainPage extends StatefulWidget {
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>  {
  int _currentIndex = 0;
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('微信'),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){},),
          IconButton(icon: Icon(Icons.add),onPressed: (){},),
        ],
      ),
      body: PageView(
        controller: _controller,
        children: <Widget>[
          ChatMain(),
          ContactMain(),
          FindMoreMain(),
          SelfMain(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline),title:Text('微信')),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/icons/wallet_address_contact_icon.png")),title:Text('联系人')),
          BottomNavigationBarItem(icon: Icon(Icons.gps_fixed),title:Text('发现')),
          BottomNavigationBarItem(icon: Icon(Icons.person),title:Text('我')),
        ],
        onTap: (index){
          setState(() {
                      _currentIndex = index;
                    });
          _controller.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
        },
      ),
    );
  }
}