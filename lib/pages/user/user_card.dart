import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

/// 用户卡片
class UserCard extends StatefulWidget {
  final int index;
  final String userName;
  final int sex;
  final String avatar;
  final Function(int, String) commit;

  const UserCard(this.commit, {Key key, @required this.index, this.userName, this.sex, this.avatar}) : super(key: key);

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
              FadeInImage.assetNetwork(
                  image: widget.avatar,
                  placeholder: "assets/images/loading.gif",
                  fadeOutDuration: Duration(milliseconds: 3000),
                  fadeOutCurve: Curves.easeOut),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                RaisedButton(
                  color: Colors.blue,
                  colorBrightness: Brightness.dark,
                  child: Text("SR"),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {
                    widget.commit(widget.index, "SR");
                  },
                ),
                RaisedButton(
                  color: Colors.cyan,
                  colorBrightness: Brightness.dark,
                  child: Text("R"),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {
                    widget.commit(widget.index, "R");
                  },
                ),
                RaisedButton(
                  color: Colors.orange,
                  colorBrightness: Brightness.dark,
                  child: Text("N"),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {
                    widget.commit(widget.index, "N");
                  },
                )
              ]),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
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
                    flex: 2,
                  ),
                  Expanded(
                      child: RaisedButton(
                    color: Colors.red,
                    colorBrightness: Brightness.dark,
                    child: Text('不通过'),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      widget.commit(widget.index, "不通过");
                    },
                  )),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
