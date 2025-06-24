import 'dart:io';

import 'package:flutter/material.dart';
import 'user.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {//封装
  final User user;

  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {//实现
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('欢迎 ${widget.user.username}')),
      body: Column(
        children: [
          Container(
          width: 200,
          height: 200,
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          transform: Matrix4.translationValues(0,0,0)..rotateZ(0),


          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black,width: 2),
            boxShadow: const[
              BoxShadow(
                color: Colors.black,
                blurRadius: 20,
                offset:Offset(4,4),
              )
            ],
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.orange],
              
            )
          ),
        child: Text(
          '权限等级：${widget.user.authorityLevel} and $counter',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            wordSpacing: 2,
            decoration: TextDecoration.overline,
            decorationColor: Colors.red,
            decorationStyle: TextDecorationStyle.dotted,
          )
        ),
        
        ),
        Container(
          height: 50,
          width: 100, // widen to fit two buttons
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () async {
                  bool? confirm = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('确认退出'),
                      content: const Text('Sure to quit application?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('No'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text('Yes'),
                        ),
                      ],
                    ),
                  );
                  if (confirm == true) {
                    exit(0); // 关闭应用
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.restart_alt),
                onPressed: () async {
                  bool? confirm = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('退出登录确认'),
                      content: const Text('Quit to login page?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('No'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text('Yes'),
                        ),
                      ],
                    ),
                  );
                  if (confirm == true) {
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                  }
                },
              ),
            ],
          ),
        )
          
        ]  
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