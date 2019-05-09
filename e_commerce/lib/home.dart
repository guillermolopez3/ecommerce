import 'package:flutter/material.dart';
import 'model/app_state_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'model/product.dart';

class HomeState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('prueba'),),
      body: Home()
    );
  }
}

class Home extends StatelessWidget {

  List<Product> product ;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppStateModel>(
      builder: (context, child, model){
        this.product = model.getProducts();
        return _buildListView();
      }
    );
  }

  _buildListView() {
    return ListView.builder(
        itemCount: product.length,
        itemBuilder: (context, index){
          return _itemList(product[index]);
        }
    );
  }
  
  _itemList(Product pro){
    return Container(
      height: 80.0,
      child: Column(
        children: <Widget>[
          Text(
            pro.name,
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            pro.price.toString(),
            style: TextStyle(fontSize: 14.0),
          )
        ],
      ),
    );
  }
}
