import 'package:e_commerce/model/app_state_model.dart';
import 'package:e_commerce/model/product.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:intl/intl.dart';

const _leftColumnWidth = 60.0;

class Carrito extends StatefulWidget {
  @override
  _CarritoState createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {



  @override
  Widget build(BuildContext context) {
    final localTheme = Theme.of(context);
    return Container(
      child: ScopedModelDescendant<AppStateModel>(
        builder: (context, child, model) {
          return Stack(
            children: <Widget>[
              ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(

                      children: [
                        SizedBox(height: 30.0,),
                        Text(
                          'PRODUCTOS EN EL CARRITO: ',
                          style: localTheme.textTheme.subhead
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 5.0),
                        Text('${model.totalCartQuantity} ITEMS'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Column(
                    children: _createShoppingCartRows(model),
                  ),
                  ShoppingCartSummary(model: model),
                  const SizedBox(height: 100.0),
                ],
              ),
              Positioned(
                bottom: 16.0,
                left: 16.0,
                right: 16.0,
                child: RaisedButton(
                  shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  color: Colors.blue,
                  splashColor: Colors.grey,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text('FINALIZAR COMPRA'),
                  ),
                  onPressed: () {
                    model.clearCart();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _createShoppingCartRows(AppStateModel model) {
    return model.productsInCart.keys
        .map(
          (id) => ShoppingCartRow(
        product: model.getProductById(id),
        quantity: model.productsInCart[id],
        onPressed: () {
          model.removeItemFromcart(id);
        },
      ),
    )
        .toList();
  }

}


class ShoppingCartRow extends StatelessWidget {
  ShoppingCartRow(
      {@required this.product, @required this.quantity, this.onPressed});

  final Product product;
  final int quantity;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.simpleCurrency(
        decimalDigits: 0, locale: Localizations.localeOf(context).toString());
    final localTheme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        key: ValueKey(product.id),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: _leftColumnWidth,
            child: IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: onPressed,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        product.assetName,
                        //package: product.assetName,
                        fit: BoxFit.cover,
                        width: 75.0,
                        height: 75.0,
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text('Cantidad: $quantity'),
                                ),
                                Text('x ${formatter.format(product.price)}'),
                              ],
                            ),
                            Text(
                              product.name,
                              style: localTheme.textTheme.subhead
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Divider(
                    color: Colors.yellow,
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class ShoppingCartSummary extends StatelessWidget {
  ShoppingCartSummary({this.model});

  final AppStateModel model;

  @override
  Widget build(BuildContext context) {
    final smallAmountStyle =
    Theme.of(context).textTheme.body1.copyWith(color: Colors.deepOrange);
    final largeAmountStyle = Theme.of(context).textTheme.display1;
    final formatter = NumberFormat.simpleCurrency(
        decimalDigits: 2, locale: Localizations.localeOf(context).toString());

    return Row(
      children: [
        SizedBox(width: _leftColumnWidth),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Text('TOTAL'),
                    ),
                    Text(
                      formatter.format(model.totalCost),
                      style: largeAmountStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    const Expanded(
                      child: Text('Subtotal:'),
                    ),
                    Text(
                      formatter.format(model.subTotalCost),
                      style: smallAmountStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    const Expanded(
                      child: Text('Costo envío:'),
                    ),
                    Text(
                      formatter.format(model.shippingCost),
                      style: smallAmountStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    const Expanded(
                      child: Text('IVA:'),
                    ),
                    Text(
                      formatter.format(model.iva),
                      style: smallAmountStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

