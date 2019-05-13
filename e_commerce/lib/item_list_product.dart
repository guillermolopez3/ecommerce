import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'model/product.dart';
import 'model/app_state_model.dart';

//Clase que se encarga de dibujar los items de la lista con productos (Img, nombre, precio anterior, precio actual y botones de fav y agregar a carrito

class ItemListProducts extends StatelessWidget {
  final Product product;

  ItemListProducts({this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 4.0,
        child: Column(
          children: <Widget>[
            Container(
              child: Image.asset(
                product.assetName,
                fit: BoxFit.cover,
              ),
              height: 200,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              product.name,
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "\$200",
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.red,
                  decoration: TextDecoration.lineThrough),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                  Text(
                    '\$${product.price}',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  ScopedModelDescendant<AppStateModel>(
                    builder: (context, child, model) {
                      return IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          model.addProductsToCart(product.id);
                        },
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
