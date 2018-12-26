import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:oktoast/oktoast.dart';

import '../component.dart';
import 'friend_detail.dart';

class ContactMain extends StatefulWidget {
  _ContactMainState createState() => _ContactMainState();
}

class ContactItem extends StatelessWidget {
  final ContactItemData contactItemData;
  const ContactItem({Key key, this.contactItemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (contactItemData.contactItemType == ContactItemType.ContactFriend) {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (BuildContext context) =>
                      FriendDetail(contactItemData: contactItemData)));
        } else {
          showToast("微信:" + contactItemData.name);
        }
      },
      child: Padding(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: (contactItemData.contactItemType ==
                      ContactItemType.ContactTag)
                  ? Image.asset(contactItemData.assetsName,
                      width: 32,
                      height: 32,
                      color: Colors.blue,
                      colorBlendMode: BlendMode.color)
                  : Image.asset(contactItemData.assetsName,
                      width: 32, height: 32),
            ),
            Flexible(
                flex: 3,
                fit: FlexFit.loose,
                child: Container(
                    child: Text(
                  contactItemData.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                ))),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      ),
    );
  }
}

class _ContactMainState extends State<ContactMain> {
  static List<ContactItemData> _itemList = <ContactItemData>[
    ContactItemData("assets/icons/addfriend_icon_contact.png", "新的朋友",
        ContactItemType.ContactNewFriend),
    ContactItemData("assets/icons/addfriend_icon_qucikgroup.png", "群组",
        ContactItemType.ContacGroupFriend),
    ContactItemData("assets/icons/addfriend_icon_tag.png", "标签",
        ContactItemType.ContactTag),
    ContactItemData("assets/icons/addfriend_icon_official.png", "公众号",
        ContactItemType.ContactOffical),
    ContactItemData(
        "assets/icons/headshow1.png", "Alice", ContactItemType.ContactFriend),
    ContactItemData(
        "assets/icons/headshow2.png", "Bob", ContactItemType.ContactFriend),
    ContactItemData(
        "assets/icons/headshow3.png", "Coco", ContactItemType.ContactFriend),
    ContactItemData(
        "assets/icons/headshow4.png", "Duck", ContactItemType.ContactFriend,
        gender: Gender.Female),
    ContactItemData(
        "assets/icons/headshow5.png", "Elf", ContactItemType.ContactFriend,
        gender: Gender.Female),
    ContactItemData(
        "assets/icons/headshow6.png",
        "Wow? My name is very very very very long",
        ContactItemType.ContactFriend,
        gender: Gender.Female),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      color: Colors.cyan,
      child: ListView.separated(
        itemCount: _itemList.length,
        itemBuilder: (BuildContext context, int index) {
          return ContactItem(contactItemData: _itemList[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return (index == 3)
              ? LetterDivider(letter: "A")
              : Divider(
                  height: 2.0,
                );
        },
      ),
    );
  }
}
