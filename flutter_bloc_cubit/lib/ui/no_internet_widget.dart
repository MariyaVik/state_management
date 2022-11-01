import 'package:flutter/material.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Image.asset('images/gg.png'),
        const Text('Нет подключения к интернету'),
        const Text('Проверьте подключение и попробуйте обносить страницу'),
        ElevatedButton(onPressed: () {}, child: const Text('Обновить')),
      ],
    );
  }
}
