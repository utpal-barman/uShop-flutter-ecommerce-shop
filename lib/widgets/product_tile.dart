import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:u_shop/model/product.dart';
import 'package:u_shop/screens/product_detail_screen.dart';

class ProductTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetailScreen.routeName, arguments: product.id);
        },
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: Icon(
                  product.isFavourite ? Icons.favorite_border : Icons.favorite),
              color: Theme.of(context).accentColor,
              onPressed: () {
                //toggle here
                product.toggleFavorite();
              },
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
