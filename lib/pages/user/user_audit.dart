import 'package:flutter/material.dart';
import 'package:flutter_app/model/system_status_entity.dart';
import 'package:flutter_app/model/user_item_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

void main() => runApp(UserAudit());

class UserAudit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserAuditState();
}

class _UserAuditState extends State<UserAudit> {
  List<UserItemEntity> userItems;

  void fetchData() async {
    Response response = await Dio().get("http://test-pikpik-api.weli010.cn/pikpik/system/status");
    print(response.toString());
    SystemStatusEntity ss = SystemStatusEntity().fromJson(jsonDecode(response.toString()));
    print("${ss.data}>>>>>");
  }

  void post() async {
    Response response = await Dio()
        .post("http://test-pikpik-api.weli010.cn/pikpik/system/status", data: {"id": 3, "name": "liuwangshu"});
  }

  @override
  void initState() {
    super.initState();
    // 请求服务器数据
    fetchData();
    // 定义json数据
    var data = [
      {
        "id":1,
        "user_name": "张三",
        "sex": 1,
        "avatar":
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586769048019&di=cf952359b63fd6a90ab57c7662c875a0&imgtype=0&src=http%3A%2F%2Fpic1.zhimg.com%2F50%2Fv2-2f3dfd6f7da18983fd5a4e48747d7ee3_hd.jpg"
      },
      {
        "id":2,
        "user_name": "李四",
        "sex": 1,
        "avatar":
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586769048019&di=cf952359b63fd6a90ab57c7662c875a0&imgtype=0&src=http%3A%2F%2Fpic1.zhimg.com%2F50%2Fv2-2f3dfd6f7da18983fd5a4e48747d7ee3_hd.jpg"
      },
      {
        "id":3,
        "user_name": "刘玄德",
        "sex": 1,
        "avatar":
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586769048019&di=cf952359b63fd6a90ab57c7662c875a0&imgtype=0&src=http%3A%2F%2Fpic1.zhimg.com%2F50%2Fv2-2f3dfd6f7da18983fd5a4e48747d7ee3_hd.jpg"
      }
    ];
    // json数据解析
    userItems = data.map((e) => UserItemEntity().fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      theme: new ThemeData(primaryColor: Colors.blue, errorColor: Colors.red),
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar(title: Text("用户信息审核")), body: _userList()),
    );
  }

  // 用户信息列表
  ListView _userList() {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: userItems.length,
      itemBuilder: (BuildContext context, int index) {
        return UserCard(deleteUserItem,
            index: index,
            userName: userItems[index].userName,
            sex: userItems[index].sex,
            avatar: userItems[index].avatar);
      },
    );
  }

  void deleteUserItem(index) {
    // 更新UI
    setState(() => userItems.removeAt(index));
  }
}

class UserCard extends StatefulWidget {
  final int index;
  final String userName;
  final int sex;
  final String avatar;
  final Function(int) removeUserCard;

  const UserCard(this.removeUserCard, {Key key, @required this.index, this.userName, this.sex, this.avatar})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(750, 1334), allowFontScaling: true);
    return Card(
      borderOnForeground: false, // 是否在 child 前绘制 border，默认为 true
      child: Container(
          alignment: Alignment.center,
          // 边框分割线
          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Colors.blue))),
          child: Column(
            children: [
              Image.network(widget.avatar),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                RaisedButton(
                  color: Colors.blue,
                  colorBrightness: Brightness.dark,
                  child: Text("SR"),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {
                    setState(() {
                      // todo
                    });
                  },
                ),
                RaisedButton(
                  color: Colors.cyan,
                  colorBrightness: Brightness.dark,
                  child: Text("R"),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {
                    setState(() {
                      // todo
                    });
                  },
                ),
                RaisedButton(
                  color: Colors.orange,
                  colorBrightness: Brightness.dark,
                  child: Text("N"),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {
                    setState(() {
                      // todo
                    });
                  },
                )
              ]),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 25, right: 120, top: 0, bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("昵称：${widget.userName}",
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(28, allowFontScalingSelf: true),
                                )),
                            Text("性别：${widget.sex == 1 ? '男' : '女'}",
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(28, allowFontScalingSelf: true),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            RaisedButton(
                              color: Colors.red,
                              colorBrightness: Brightness.dark,
                              child: Text('不通过'),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () {
                                setState(() => widget.removeUserCard(widget.index));
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
