import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';
//import 'package:intl/date_symbol_data_local.dart';

enum ChatType { SingleChat, GroupChat, OfficalChat, SubscribeChat }

class ChatItemData {
  final String chatTitle;
  final String lastFrom;
  final String lastChatContent;
  final DateTime lastChatTime;
  final ChatType chatType;
  final List<Widget> children; //for leading icons
  ChatItemData(
      {this.chatTitle = "",
      this.lastFrom = "",
      this.lastChatContent = "",
      this.lastChatTime,
      this.chatType = ChatType.SingleChat,
      this.children = const []});
}

class ChatItem extends StatelessWidget {
  final ChatItemData chatItemData;
  const ChatItem({Key key, this.chatItemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox.fromSize(
          size: Size.square(48.0), child: chatItemData.children[0]),
      title: Text(chatItemData.chatTitle),
      subtitle: Text(chatItemData.lastChatContent),
      trailing: Text(_formatDateTime()),
      onTap: () {
        showToast(
            "${chatItemData.lastFrom}:\"${chatItemData.lastChatContent}\"");
      },
      onLongPress: () {},
    );
  }

  String _formatDateTime() {
    final value = chatItemData.lastChatTime;
    final now = DateTime.now();
    final lastMidnight = DateTime(now.year, now.month, now.day);
    if (value.isAfter(lastMidnight)) {
      return DateFormat.Hm().format(value);
    } else {
      return DateFormat.MMMd("zh_CN").format(value);
    }
  }
}

List<ChatItemData> _chatSessions = [
  ChatItemData(
      chatTitle: "张三",
      lastFrom: "张三",
      lastChatContent: "[图片]",
      lastChatTime: DateTime(2018, 12, 25, 18, 53),
      children: [
        Image.asset("assets/icons/headshow1.png"),
      ]),
  ChatItemData(
      chatTitle: "Amy",
      lastFrom: "I",
      lastChatContent: "merry X'mas",
      lastChatTime: DateTime(2018, 12, 24, 18, 53),
      children: [
        Image.asset("assets/icons/headshow3.png"),
      ]),
  ChatItemData(
      chatTitle: "Samy",
      lastFrom: "Samy",
      lastChatContent: "u known nothing,snow.",
      lastChatTime: DateTime.now(),
      children: [
        Image.asset("assets/icons/headshow4.png"),
      ])
];

class ChatMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ChatItem(chatItemData: _chatSessions[index]);
        },
        itemCount: _chatSessions.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 2.0);
        });
  }
}
