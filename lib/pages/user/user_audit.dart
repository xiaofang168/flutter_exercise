import 'package:flutter/material.dart';

void main() => runApp(UserAudit());

class UserAudit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserAuditState();
}

class _UserAuditState extends State<UserAudit> {
  List listData;

  @override
  void initState() {
    super.initState();
    // 初始化_userList
    listData= [
      {
        "userName": "张三",
        "sex": 1,
        "avatar":
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586769048019&di=cf952359b63fd6a90ab57c7662c875a0&imgtype=0&src=http%3A%2F%2Fpic1.zhimg.com%2F50%2Fv2-2f3dfd6f7da18983fd5a4e48747d7ee3_hd.jpg"
      },
      {
        "userName": "李四",
        "sex": 1,
        "avatar":
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586769048019&di=cf952359b63fd6a90ab57c7662c875a0&imgtype=0&src=http%3A%2F%2Fpic1.zhimg.com%2F50%2Fv2-2f3dfd6f7da18983fd5a4e48747d7ee3_hd.jpg"
      },
      {
        "userName": "刘玄德",
        "sex": 1,
        "avatar":
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586769048019&di=cf952359b63fd6a90ab57c7662c875a0&imgtype=0&src=http%3A%2F%2Fpic1.zhimg.com%2F50%2Fv2-2f3dfd6f7da18983fd5a4e48747d7ee3_hd.jpg"
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      theme: new ThemeData(
        errorColor: Colors.red,
        brightness: Brightness.dark,
      ),
      home: Scaffold(appBar: AppBar(title: Text("用户信息审核")), body: _userList()),
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return UserCard(
        userName: listData[index]['userName'],
        sex: 1,
        avatar: listData[index]['avatar']);
  }

  // 用户信息列表
  ListView _userList() {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: listData.length,
      itemBuilder: _listItemBuilder,
    );
  }
}

class UserCard extends StatefulWidget {
  final String userName;
  final int sex;
  final String avatar;

  UserCard({Key key, this.userName, this.sex, this.avatar})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  String _newLevel = "SR";
  Color _btColor = Colors.grey;
  int _btClickCount = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: false, // 是否在 child 前绘制 border，默认为 true
      child: Container(
          alignment: Alignment.center,
          // 边框分割线
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: Colors.blue))
          ),
          child: Column(
            children: [
              Image.network(widget.avatar),
              Row(children: [
                Flexible(
                    child: RadioListTile<String>(
                  value: 'SR',
                  title: Text('SR'),
                  groupValue: _newLevel,
                  onChanged: (value) {
                    setState(() {
                      this._newLevel = value;
                    });
                  },
                )),
                Flexible(
                    child: RadioListTile<String>(
                  value: 'R',
                  title: Text('R'),
                  groupValue: _newLevel,
                  onChanged: (value) {
                    setState(() {
                      this._newLevel = value;
                    });
                  },
                )),
                Flexible(
                    child: RadioListTile<String>(
                  value: 'N',
                  title: Text('N'),
                  groupValue: _newLevel,
                  onChanged: (value) {
                    setState(() {
                      this._newLevel = value;
                    });
                  },
                ))
              ]),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: 25, right: 120, top: 0, bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("昵称：${widget.userName}"),
                            Text("性别：${widget.sex == 1 ? '男' : '女'}")
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
                              color: _btColor,
                              child: Text('不通过'),
                              onPressed: () {
                                setState(() {
                                  if (_btClickCount == 0) {
                                    _btColor = Colors.red;
                                    _btClickCount = _btClickCount + 1;
                                  } else {
                                    _btColor = Colors.grey;
                                    _btClickCount = _btClickCount - 1;
                                  }
                                });
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text("你选择的是${this._newLevel}")],
              ),
            ],
          )),
    );
  }
}
