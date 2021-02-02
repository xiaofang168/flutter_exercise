import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/config/application.dart';
import 'package:flutter_app/config/routes.dart';
import 'package:flutter_app/model/system_status_entity.dart';
import 'package:flutter_app/model/user_item_entity.dart';
import 'package:flutter_app/model/user_search_entity.dart';
import 'package:flutter_app/pages/user/user_audit_search.dart';
import 'package:flutter_app/pages/user/user_card.dart';
import 'package:flutter_app/utils/toast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() => runApp(UserAuditList());

class UserAuditList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    // 路由初始化
    Routes.configureRoutes(router);
    Application.router = router;
    return MaterialApp(
      title: "Material",
      theme: new ThemeData(primaryColor: Colors.blue, errorColor: Colors.red),
      debugShowCheckedModeBanner: false,
      home: UserAuditListHome(),
      builder: EasyLoading.init(),
      // 路由静态化
      onGenerateRoute: Application.router.generator,
    );
  }
}

/// 用户审核列表主页
class UserAuditListHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserAuditListHomeState();
}

class _UserAuditListHomeState extends State<UserAuditListHome> {
  ScrollController _scrollController = new ScrollController();
  List<UserItemEntity> userItems = [];
  UserSearchEntity userSearchEntity = UserSearchEntity(date: "", sex: "");
  String dataAlert = "数据加载中...";

  // 下拉刷新->转一秒的圈,回调刷新的方法
  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      _fetchData();
    });
  }

  void _fetchData() async {
    try {
      Response response = await Dio().get("http://test-pikpik-api.weli010.cn/pikpik/system/status");
      print(response.toString());
      SystemStatusEntity ss = SystemStatusEntity().fromJson(jsonDecode(response.toString()));
      print("${ss.data}>>>>>");
      var data = [
        {
          "id": 1,
          "user_name": "张三",
          "sex": 1,
          "avatar":
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586769048019&di=cf952359b63fd6a90ab57c7662c875a0&imgtype=0&src=http%3A%2F%2Fpic1.zhimg.com%2F50%2Fv2-2f3dfd6f7da18983fd5a4e48747d7ee3_hd.jpg"
        },
        {
          "id": 2,
          "user_name": "李四",
          "sex": 1,
          "avatar":
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586769048019&di=cf952359b63fd6a90ab57c7662c875a0&imgtype=0&src=http%3A%2F%2Fpic1.zhimg.com%2F50%2Fv2-2f3dfd6f7da18983fd5a4e48747d7ee3_hd.jpg"
        },
        {
          "id": 3,
          "user_name": "刘玄德",
          "sex": 1,
          "avatar":
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586769048019&di=cf952359b63fd6a90ab57c7662c875a0&imgtype=0&src=http%3A%2F%2Fpic1.zhimg.com%2F50%2Fv2-2f3dfd6f7da18983fd5a4e48747d7ee3_hd.jpg"
        }
      ];
      // json数据解析
      setState(() {
        userItems = data.map((e) => UserItemEntity().fromJson(e)).toList();
      });
    } catch (e) {
      print(e);
      AppToast.show('服务异常...');
    }
  }

  void _commit(int index, String level) {
    print("$index >>> $level");
    // 更新UI
    // Dio().post("http://test-pikpik-api.weli010.cn/pikpik/system/status", data: {"id": 3, "name": "liuwangshu"}).then(
    //   (value) => {
    //         if (value.toString() != "") {setState(() => userItems.removeAt(index))} else {AppToast.show('服务异常...')}
    //       });
  }

  @override
  void initState() {
    super.initState();
    // 请求服务器数据
    _fetchData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // 当滑到最底部时调用
        print("到底了...");
      }
    });
  }

  void _userSearch(UserSearchEntity userSearchEntity) async {
    this.userSearchEntity = userSearchEntity;
    var data = [
      {
        "id": 1,
        "user_name": "凯德茂的猫",
        "sex": 1,
        "avatar":
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586769048019&di=cf952359b63fd6a90ab57c7662c875a0&imgtype=0&src=http%3A%2F%2Fpic1.zhimg.com%2F50%2Fv2-2f3dfd6f7da18983fd5a4e48747d7ee3_hd.jpg"
      },
      {
        "id": 2,
        "user_name": "钢铁侠",
        "sex": 1,
        "avatar":
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586769048019&di=cf952359b63fd6a90ab57c7662c875a0&imgtype=0&src=http%3A%2F%2Fpic1.zhimg.com%2F50%2Fv2-2f3dfd6f7da18983fd5a4e48747d7ee3_hd.jpg"
      },
      {
        "id": 3,
        "user_name": "蜘蛛侠",
        "sex": 1,
        "avatar":
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586769048019&di=cf952359b63fd6a90ab57c7662c875a0&imgtype=0&src=http%3A%2F%2Fpic1.zhimg.com%2F50%2Fv2-2f3dfd6f7da18983fd5a4e48747d7ee3_hd.jpg"
      }
    ];
    await EasyLoading.show();
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        // 更新用户列表
        userItems = data.map((e) => UserItemEntity().fromJson(e)).toList();
      });
    });
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("用户信息审核"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => UserAuditSearch(
                        userSearchEntity: userSearchEntity,
                        userSearchCallback: _userSearch,
                      ));
            },
          )
        ],
      ),
      body: userItems.length > 0
          ? RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: userItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return UserCard(_commit,
                      index: index,
                      userName: userItems[index].userName,
                      sex: userItems[index].sex,
                      avatar: userItems[index].avatar);
                },
                controller: _scrollController,
              ),
            )
          : Center(
              child: Text("$dataAlert"),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => UserAuditSearch(
                    userSearchEntity: userSearchEntity,
                    userSearchCallback: _userSearch,
                  ));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: '通讯录',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: '设置',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        onTap: (int index) {
          print(index);
          if(index==2){
            Application.router.navigateTo(context, "/setting");
          }
        },
      ),
    );
  }
}
