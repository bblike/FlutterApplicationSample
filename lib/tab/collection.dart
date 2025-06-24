import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CollectionPage extends StatefulWidget {

  const CollectionPage({super.key});

  @override 
  State<CollectionPage> createState() => _CollectionPageState();
  
}

class _CollectionPageState extends State<CollectionPage> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("搜索"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // ----- 返回到上一个页面
              Navigator.pop(context);
            },
            child: const Text("返回")
        ),
      ),
    );
  }
}