import 'package:flutter/material.dart';
import 'home_page.dart'; // 你的 HomePage 文件
import 'user.dart'; // 如果你把 User 单独放在 user.dart 的话


class LoginPage extends StatefulWidget {//封装
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {//功能实现
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true; // fixed typo
  String _errorText = '请输入用户名和密码';
  TextStyle _errorTextStyle = const TextStyle(color: Colors.green); // 新增

  // 模拟登录逻辑
  bool validateUser(String username, String password) {
    // 你可以替换成实际验证逻辑
    return username == 'admin' && password == '123456';
  }

  // 密码比对判断
  void _handleLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (validateUser(username, password)) {
      User user = User(1, username, password);

      // 登录成功，跳转到 HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(user: user),
        ),
      );
    } else {
      setState(() {
        _errorText = '用户名或密码错误，请重试';
        _errorTextStyle = const TextStyle(color: Colors.red); // 正确做法
      });
    }
  }

  @override
  // 登陆界面控制
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('账户登陆')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [  
            Image.asset('assets/trump.jpg'),  
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: '用户名'),
            ),

            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword, // 密码是否可见
              decoration: InputDecoration(
                labelText: '密码',
                suffixIcon: IconButton(
                  icon: _obscurePassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility), // 根据状态显示图标
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword; // 切换密码可见性
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleLogin,
              child: const Text('登录'),
            ),
            const SizedBox(height: 10),
            Text(
              _errorText,
              style: _errorTextStyle, // 使用变量
            ),
            const SizedBox(height:20),
            OverflowBar(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _usernameController.text = 'admin';
                      _passwordController.text = '123456';
                      
                    });
                  },
                  autofocus: true,
                  child: const Text("Default User"),
                ),
              ],
            )
          ],
        ),
        
      ),
    );
  }
}
