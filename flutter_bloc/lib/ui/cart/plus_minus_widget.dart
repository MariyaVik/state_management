import 'package:flutter/material.dart';

class PlusMinusWidget extends StatelessWidget {
  const PlusMinusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
      child: Row(
        children: [
          IconButton(
            icon: Text('-'),
            onPressed: (() {}),
          ),
          Text('5'),
          IconButton(
            icon: Text('+'),
            onPressed: (() {}),
          ),
        ],
      ),
    );
  }
}
