import 'package:flutter/material.dart';

class PlaceOrderScreen extends StatelessWidget {
  static const routeName = '/place-order';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Place Order"),
        centerTitle: true,
      ),
    );
  }
}
