import 'package:flutter/material.dart';

void main()=> runApp(World());

class World extends StatefulWidget {
  @override
  _WorldState createState() => _WorldState();
}

class _WorldState extends State<World> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0), //容器内补白
      color: Colors.orange,
      child: Text(
          "Hello world!",
          textDirection: TextDirection.ltr
      )
    );
  }
}

