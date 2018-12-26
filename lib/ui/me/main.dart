import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import '../component.dart';

class SelfMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var withBackground = Stack(children: <Widget>[
      Container(color: Colors.black12),
      Material(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InkWell(
            onTap: () {
              showToast("微信：显示个人信息");
            },
            child: ListTile(
              leading: Image.asset("assets/icons/headshow6.png", width: 64),
              title: Text('Amy'),
              subtitle: Text('微信号:wx_000001'),
              trailing: IconButton(
                icon: ImageIcon(
                  AssetImage("assets/icons/addfriend_icon_myqr.png"),
                  size: 24.0,
                ),
                onPressed: () {
                  showToast("微信：显示个人二维码");
                },
              ),
            ),
          ),
          LetterDivider(),
          CommandItem(
              leading: Image.asset("assets/icons/ofm_card_icon.png",
                  width: 36, color: Colors.blue),
              name: '钱包'),
          LetterDivider(),
          CommandItem(
              leading: Image.asset(
                "assets/icons/more_my_favorite.png",
                width: 36,
              ),
              name: '收藏'),
          Divider(
            height: 2.0,
          ),
          CommandItem(
              leading: Image.asset(
                "assets/icons/more_my_album.png",
                width: 36,
              ),
              name: '相册'),
          Divider(
            height: 2.0,
          ),
          CommandItem(
              leading: Image.asset("assets/icons/more_my_bank_card.png",
                  width: 36, color: Colors.blue),
              name: '卡包'),
          Divider(
            height: 2.0,
          ),
          CommandItem(
              leading: Image.asset(
                "assets/icons/more_emoji_store.png",
                width: 36,
              ),
              name: '表情'),
          LetterDivider(),
          CommandItem(
              leading: Image.asset(
                "assets/icons/more_setting.png",
                width: 36,
              ),
              name: '设置'),
        ],
      )),
    ]);

    return withBackground;
  }
}
