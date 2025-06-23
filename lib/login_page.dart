import 'package:flutter/material.dart';
import 'home_page.dart'; // 你的 HomePage 文件
import 'user.dart'; // 如果你把 User 单独放在 user.dart 的话

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true; // fixed typo
  String _errorText = '';

  // 模拟登录逻辑
  bool validateUser(String username, String password) {
    // 你可以替换成实际验证逻辑
    return username == 'admin' && password == '123456';
  }

  void _handleLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    // Removed: bool _obsurePassword = true;

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
        _errorText = '用户名或密码错误';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('登录')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [    
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: '用户名'),
            ),

            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword, // fixed typo
              decoration: InputDecoration(
                labelText: '密码',
                suffixIcon: IconButton(
                  icon: _obscurePassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility), // fixed typo
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword; // fixed typo
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
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
