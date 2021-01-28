import 'package:flutter/material.dart';

class UserAuditSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserAuditSearchState();
}

class _UserAuditSearchState extends State<UserAuditSearch> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('SimpleDialog'),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('我是男人'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('我是女人'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('我是人妖'),
        ),
      ],
    );
  }
}
