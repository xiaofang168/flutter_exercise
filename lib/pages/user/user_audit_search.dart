import 'package:flutter/material.dart';
import 'package:flutter_app/model/user_search_entity.dart';

typedef void UserSearchCallback(UserSearchEntity userSearchEntity);

class UserAuditSearch extends StatefulWidget {
  const UserAuditSearch({Key key, this.userSearchCallback}) : super(key: key);

  final UserSearchCallback userSearchCallback;

  @override
  State<StatefulWidget> createState() => _UserAuditSearchState();
}

class _UserAuditSearchState extends State<UserAuditSearch> {
  TextEditingController dateController = new TextEditingController();
  TextEditingController sexController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('待审核用户信息查询'),
      children: [
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.all(10.0),
            icon: Icon(Icons.calendar_today),
            labelText: '注册日期',
            helperText: 'yyyyMMdd',
          ),
          autofocus: true,
          controller: dateController,
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.all(10.0),
            icon: Icon(Icons.person),
            labelText: '性别',
            helperText: '0:女 1男',
          ),
          controller: sexController,
        ),
        Center(
          child: RaisedButton(
            color: Colors.blue,
            colorBrightness: Brightness.dark,
            child: Text("查询"),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              // 获取输入框中的值
              widget.userSearchCallback(new UserSearchEntity(date: dateController.text, sex: int.parse(sexController.text)));
              // 查询&关闭窗口
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
