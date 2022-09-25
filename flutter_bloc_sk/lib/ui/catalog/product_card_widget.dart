import 'package:flutter/material.dart';
import 'package:flutter_bloc_sk/models/product.dart';

// class ProductCardWidget extends StatefulWidget {
//   Product product;
//   ProductCardWidget({required this.product, Key? key}) : super(key: key);

//   @override
//   State<ProductCardWidget> createState() => _ProductCardWidgetState();
// }

class ProductCardWidget extends StatelessWidget {
  Product product;
  ProductCardWidget({required this.product, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox.square(
          dimension: MediaQuery.of(context).size.width / 2,
          child: Card(
            clipBehavior: Clip.hardEdge,
            color: Colors.red,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  // loadingBuilder: (context, child, fgvd) =>
                  //     CircularProgressIndicator(),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.amber,
                    ),
                    // color: Colors.amber,
                    child: IconButton(
                      splashRadius: null,
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Text(
          product.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          children: [
            Icon(Icons.star),
            Text(product.rating.rate.toString()),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 15,
              width: 1,
              color: Colors.black,
            ),
            Text(product.rating.count.toString()),
          ],
        ),
        Text('\u0024${product.price}'),
        ElevatedButton(onPressed: () {}, child: Text('В корзину')),
      ],
    );
  }
}
