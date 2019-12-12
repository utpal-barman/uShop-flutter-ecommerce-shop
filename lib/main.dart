import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:u_shop/providers/products.dart';
import 'package:u_shop/screens/product_detail_screen.dart';
import 'package:u_shop/screens/product_overview_screen.dart';
import 'package:u_shop/widgets/drawer_menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Products(),
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
    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.menu),
        actions: <Widget>[
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
