import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class LetterDivider extends StatelessWidget {
  final String letter;
  final double height;
  const LetterDivider({Key key, this.letter = "", this.height = 20.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.black12),
      child: ConstrainedBox(
        child: Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              letter,
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ),
        constraints: BoxConstraints.expand(height: height),
      ),
    );
  }
}

enum Gender { Male, Female }
enum ContactItemType {
  ContactNewFriend,
  ContacGroupFriend,
  ContactTag,
  ContactOffical,
  ContactFriend,
}

class ContactItemData {
  final String assetsName;
  final String name;
  final ContactItemType contactItemType;
  final Gender gender;
  ContactItemData(this.assetsName, this.name, this.contactItemType,
      {this.gender = Gender.Male});
}

class CommandItem extends StatelessWidget {
  final String name;
  final Widget leading;
  final VoidCallback onTap;

  const CommandItem({Key key, this.name, this.leading, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (onTap != null) {
          onTap();
        } else {
          showToast("微信:" + name);
        }
      },
      leading: leading,
      title: Text(name),
    );
  }
}
