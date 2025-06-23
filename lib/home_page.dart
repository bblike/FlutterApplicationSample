import 'package:flutter/material.dart';
import 'user.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('欢迎 ${widget.user.username}')),
      body: Center(
        child: Text('权限等级：${widget.user.authorityLevel} and $counter'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        tooltip: "Special Key",
        child: const Icon(Icons.add),
      ),
    );
  }
}