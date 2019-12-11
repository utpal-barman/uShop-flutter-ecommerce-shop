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
    );
  }
}
