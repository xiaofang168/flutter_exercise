import 'package:flutter/material.dart';

class UserAuditSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserAuditSearchState();
}

class _UserAuditSearchState extends State<UserAuditSearch> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('待审核用户信息查询'),
      children: [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.all(10.0),
            icon: Icon(Icons.calendar_today),
            labelText: '注册日期',
            helperText: 'yyyy/MM/dd',
          ),
          autofocus: true,
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
        ),
        Center(
          child: RaisedButton(
            color: Colors.blue,
            colorBrightness: Brightness.dark,
            child: Text("查询"),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              // 查询&关闭窗口
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
