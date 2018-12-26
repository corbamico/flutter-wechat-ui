import 'package:flutter/material.dart';

import 'package:oktoast/oktoast.dart';
import 'package:flutter/cupertino.dart';
import '../component.dart';

class FriendDetail extends StatefulWidget {

  final ContactItemData contactItemData;
  const FriendDetail({Key key, this.contactItemData}) : super(key: key);

  @override
  _FriendDetailState createState() => _FriendDetailState();
}

class _FriendDetailState extends State<FriendDetail> {

  @override
  Widget build(BuildContext context) {
    var main = Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        leading: IconButton(padding: EdgeInsets.all(2.0), icon: Icon(Icons.arrow_back_ios), onPressed: () {Navigator.of(context).pop();},),
        title: Text('详细资料'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_horiz),onPressed: (){
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                var _listView = ListView(
                  children: <Widget>[
                    InkWell(
                      onTap: (){Navigator.pop(context);showToast("微信:设置备注及标签");},
                      child: ListTile(leading: ImageIcon(AssetImage("assets/icons/ofm_remarks_icon.png")),title: Text("设置备注及标签"))
                    ),
                    InkWell(onTap:(){Navigator.pop(context);showToast("微信:标为星级朋友");},child: ListTile(leading: Icon(Icons.star),title: Text("标为星级朋友"))),
                    InkWell(onTap:(){Navigator.pop(context);showToast("微信:设置朋友圈权限");},child: ListTile(leading: ImageIcon(AssetImage("assets/icons/ofm_moment_icon.png")), title: Text("设置朋友圈权限"))),
                    InkWell(onTap:(){Navigator.pop(context);showToast("微信:发送名片");},child: ListTile(leading:ImageIcon(AssetImage("assets/icons/ofm_send_icon.png")),title: Text("发送名片"))),
                    InkWell(onTap:(){Navigator.pop(context);showToast("微信:投诉");},child: ListTile(leading: ImageIcon(AssetImage("assets/icons/ofm_reportstop_icon.png")),title: Text("投诉"))),
                    InkWell(onTap:(){Navigator.pop(context);showToast("微信:加入黑名单");},child: ListTile(leading: Icon(Icons.do_not_disturb),title: Text("加入黑名单"))),
                    InkWell(onTap:(){Navigator.pop(context);showToast("微信:删除");},child: ListTile(leading: ImageIcon(AssetImage("assets/icons/ofm_delete_icon.png")),title: Text("删除"))),
                    InkWell(onTap:(){Navigator.pop(context);showToast("微信:添加到桌面");},child:  ListTile(leading: Icon(Icons.content_copy),title: Text("添加到桌面"))),
                  ],
                );
                return _listView;
              });
          },),
        ],
      ),
      body: _FriendDetailBody(contactItemData: widget.contactItemData,),
    );
    return main;
  }
}

class _FriendDetailBody extends StatelessWidget {
  final ContactItemData contactItemData;

  const _FriendDetailBody({Key key, this.contactItemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      
      child: Column(        
        children: <Widget>[
          LetterDivider(letter:""),
          _FriendDetailBodyHead(contactItemData: contactItemData,),
          LetterDivider(letter:""),
          InkWell(
            onTap: (){},
            child: Container(
              margin: EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              child: Text("设置备注和标签")
              ),
          ),
          LetterDivider(letter:""),
          Container(
            margin: EdgeInsets.all(10.0),
            alignment: Alignment.centerLeft,
            child: Row(          
              children: <Widget>[
                Container(child: Text('地区'),width: 80,),                
                Text('广东 东莞',style: TextStyle(color: Colors.black45),),                
              ],
            ),
          ),
          Divider(height: 2.0,),
          InkWell(
              onTap: (){},
              child: Container(
              margin: EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              child: Row(
                children: <Widget>[
                  Container(child: Text("个人相册"),width: 80,),
                  Image.asset(contactItemData.assetsName,height: 64,width: 64)
                ],
              ),
            ),
          ),
          Divider(height: 2.0,),
          InkWell(
               onTap: (){Navigator.push(
                    context, 
                    CupertinoPageRoute(
                      builder: (BuildContext context) {
                        return _FriendDetailMore(gender:contactItemData.gender);
                      })
                    );},
              child: Container(
              margin: EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,            
              child: Text('更多')),
          ),
          //LetterDivider(letter:""),
          Flexible(
            //color: Colors.black12,
            child: Container(
              margin: EdgeInsets.all(0.0),
              color: Colors.black12,
              child: Column(            
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(12.0),
                    width: double.infinity,
                    //alignment: Alignment.centerLeft,
                    child: MaterialButton(
                      elevation: 0.0,
                      color: Color.fromARGB(0xff, 0x18, 0xae, 0x18),
                      textColor: Colors.white,              
                      child: Text('发消息'),onPressed: (){}),
                  ),
                  Container(                   
                    margin: EdgeInsets.symmetric(horizontal: 12.0),
                    width: double.infinity,            
                    child: MaterialButton(
                      elevation: 0.0,
                      color: Colors.white70,   
                      child: Text('视频通话'),onPressed: (){}),
                  ),              
                ],
              ),
            ),
          ),

        ],      
      ),
    );
  }
}

class _FriendDetailBodyHead extends StatelessWidget{

  final ContactItemData contactItemData;

  const _FriendDetailBodyHead({Key key, this.contactItemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var assetGender =   contactItemData.gender == Gender.Female?  "assets/icons/ic_sex_female.png":"assets/icons/ic_sex_male.png"; 
    

    return Container(
            margin: EdgeInsets.all(10.0),
            alignment: Alignment.centerLeft,
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: (){showToast('Show Photos');},
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(contactItemData.assetsName,height: 64,width: 64),
                    width: 80),
                ),
                Expanded(                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        
                        children: <Widget>[
                          Expanded(
                            child: 
                            Row(
                              children: <Widget>[
                                Flexible(
                                    
                                  child: Container(child: Text(contactItemData.name,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16.0)))
                                ),
                                SizedBox(width: 10,),
                                Image.asset(assetGender,height:16.0,width: 16.0,alignment:Alignment.centerLeft),                                
                              ],
                            )
                            ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Image.asset("assets/icons/circle_notreceive.png",height:16.0,width: 16.0,),
                              Image.asset("assets/icons/circle_notvisible.png",height:16.0,width: 16.0,),
                            ],
                          ),                        
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('微信号:',style: TextStyle(color: Colors.black45,fontSize: 12.0)),
                          InkWell(
                            onLongPress: () async {
                              int value = await 
                              showMenu<int>(
                                context: context,                                 
                                position: RelativeRect.fromLTRB(200, 100, 100, 100),
                                items: <PopupMenuEntry<int>>[
                                  PopupMenuItem(
                                    value: 1,
                                    child: Text("复制"),                                    
                                  ),
                                ],
                              );   
                              if(value==1) showToast('微信:已复制');                           
                              },
                            child: Text('wx_12345',style: TextStyle(color: Colors.black45,fontSize: 12.0))
                          ),
                        ],
                      ),
                      Text('昵称:',style: TextStyle(color: Colors.black45,fontSize: 12.0))
                    ],
                  ),
                )
              ],
            ),
          );
  }
}


class _FriendDetailMore extends StatelessWidget {
  final Gender gender;
  const _FriendDetailMore({Key key, this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textGroup = gender==Gender.Female?"我和她的共同群聊":"我和他的共同群聊";

    var body =
    Stack(
      children: <Widget>[
        Container(color: Colors.black12),
        Material(
          child: Column(
          mainAxisSize: MainAxisSize.min,  
          children: <Widget>[
            LetterDivider(letter: ""),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10.0),
                  alignment: Alignment.centerLeft,
                  child: Text(textGroup)
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  alignment: Alignment.centerRight,          
                  child: Text("0个",style: TextStyle(color: Colors.black45,fontSize: 12.0))
                ),                
              ],
            ),            

            LetterDivider(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10.0),
                  alignment: Alignment.centerLeft,          
                  child: Text("来源")
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  alignment: Alignment.centerRight,          
                  child: Text("通过群聊添加",style: TextStyle(color: Colors.black45,fontSize: 12.0))
                ),                
              ],
            ),
            //Divider(),
            
          ],
          ),
        ),
      ],
    );

    var main = Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        leading: IconButton(padding: EdgeInsets.all(2.0), icon: Icon(Icons.arrow_back_ios), onPressed: () {Navigator.of(context).pop();},),
        title: Text('微信')
        ),
      body: body,
      );
    return main;
  }
}