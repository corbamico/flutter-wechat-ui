import 'package:flutter/material.dart';
import '../component.dart';

class FindMoreMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var withBackground = Stack(children: <Widget>[
      Container(color: Colors.black12),
      Material(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          LetterDivider(),
          CommandItem(
              leading: Image.asset(
                "assets/icons/find_more_friend_photograph_icon.png",
                width: 36,
              ),
              name: '朋友圈'),
          LetterDivider(),
          CommandItem(
              leading: Image.asset(
                "assets/icons/find_more_friend_scan.png",
                width: 36,
              ),
              name: '扫一扫'),
          Divider(
            height: 2.0,
          ),
          CommandItem(
              leading: Image.asset(
                "assets/icons/find_more_friend_shake.png",
                width: 36,
              ),
              name: '摇一摇'),
          LetterDivider(),
          CommandItem(
              leading: Image.asset(
                "assets/icons/find_more_friend_near_icon.png",
                width: 36,
              ),
              name: '附件的人'),
          Divider(
            height: 2.0,
          ),
          CommandItem(
              leading: Image.asset(
                "assets/icons/find_more_friend_bottle.png",
                width: 36,
              ),
              name: '漂流瓶'),
          LetterDivider(),
          CommandItem(
              leading: Image.asset(
                "assets/icons/userguide_gamecenter_icon.png",
                width: 36,
              ),
              name: '游戏'),
        ],
      )),
    ]);

    return withBackground;
  }
}
