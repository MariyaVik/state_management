import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
                decoration: InputDecoration(
              hintText: 'Логин (пока любой)',
              border: OutlineInputBorder(),
            )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Пароль (пока любой)',
                  border: OutlineInputBorder(),
                )),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
            child: const Text('Войти'),
          )
        ],
      ),
    );
  }
}
