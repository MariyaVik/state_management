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
              hintText: 'Логин',
              border: OutlineInputBorder(),
            )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
                decoration: InputDecoration(
              hintText: 'Пароль',
              border: OutlineInputBorder(),
            )),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Войти'),
          )
        ],
      ),
    );
  }
}
