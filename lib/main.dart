import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:u_shop/providers/cart.dart';
import 'package:u_shop/providers/products.dart';
import 'package:u_shop/screens/cart_screen.dart';
import 'package:u_shop/screens/place_order_screen.dart';
import 'package:u_shop/screens/product_detail_screen.dart';
import 'package:u_shop/screens/product_overview_screen.dart';
import 'package:u_shop/widgets/badge.dart';
import 'package:u_shop/widgets/drawer_menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'UShop',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Colors.deepOrange,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
          ),
        ),
        home: MyHomePage(title: 'UShop'),

        //register all routes here
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          PlaceOrderScreen.routeName: (context) => PlaceOrderScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

enum PopupValue {
  showFavorite,
  showAll,
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final productContainer = Provider.of<Products>(context);
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Badge(
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
            value: cart.itemCount.toString(),
          ),
          PopupMenuButton(
            onSelected: (_popupValue) {
              if (_popupValue == PopupValue.showFavorite) {
                productContainer.showFavorite();
              } else {
                productContainer.showAll();
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("Only Favorite"),
                value: PopupValue.showFavorite,
              ),
              PopupMenuItem(
                child: Text("Show All"),
                value: PopupValue.showAll,
              ),
            ],
          ),
        ],
        title: Text(title),
        centerTitle: true,
      ),
      body: ProductOverviewScreen(),
      drawer: DrawerMenu(),
    );
  }
}
