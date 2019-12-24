import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:u_shop/providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final dataRoom = Provider.of<Products>(context);
    final product = dataRoom.findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Hero(
              tag: product.id,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Card(
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Price",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Chip(
                        label: Text(
                          "\$${product.price}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "${product.description}",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
