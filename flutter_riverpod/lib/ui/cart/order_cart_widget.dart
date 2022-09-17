import 'package:flutter/material.dart';
import 'package:flutter_provider/ui/cart/plus_minus_widget.dart';

class OrderCardWidget extends StatelessWidget {
  int index;
  OrderCardWidget({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(
          255, 255 - index * 10, 255 - index * 5, 255 - index * 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SizedBox.square(
                dimension: 100,
                child: Image.network(
                  'https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      ColoredBox(color: Colors.cyan),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(index.toString()),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.delete_outline))
                    ],
                  ),
                  Text('Категория'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Цена'),
                      PlusMinusWidget(),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
