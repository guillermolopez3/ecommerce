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
          return Text(product[index].name);
        }
    );
  }
}
