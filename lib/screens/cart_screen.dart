import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:u_shop/providers/cart.dart';
import 'package:u_shop/screens/place_order_screen.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(4.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Total",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Chip(
                      label: Text("${cart.totalAmount}"),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: FittedBox(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "${cart.items.values.toList()[index].price}"),
                        )),
                      ),
                      title: Text("${cart.items.values.toList()[index].title}"),
                      subtitle: Text(
                          "Total: ${cart.items.values.toList()[index].price * cart.items.values.toList()[index].quantity}"),
                      trailing: Text(
                          "${cart.items.values.toList()[index].quantity} x"),
                    ),
                  ),
                  key: ValueKey(cart.items.keys.toList()[index]),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    cart.removeItem(cart.items.keys.toList()[index]);
                  },
                  background: Container(
                    padding: EdgeInsets.only(right: 20),
                    color: Theme.of(context).errorColor,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                );
              },
              itemCount: cart.itemCount,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text(
                "ORDER NOW",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(PlaceOrderScreen.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
