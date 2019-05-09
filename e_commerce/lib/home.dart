import 'package:flutter/material.dart';
import 'model/app_state_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'model/product.dart';
import 'product_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _searchBtn(),
        actions: <Widget>[
          IconButton(icon: IconButton(icon: Icon(Icons.filter_list), onPressed: (){}),)
        ],
      ),
      body: Body(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index){

          },
          fixedColor: Colors.black54,
          items: [
            BottomNavigationBarItem(icon: Icon( Icons.home, color: Colors.black54,), title: Text('Inicio', style: TextStyle(color: Colors.black54),),),
            BottomNavigationBarItem(icon: Icon( Icons.favorite, color: Colors.black54), title: Text('Favorito')),
            BottomNavigationBarItem(icon: Icon( Icons.shopping_cart, color: Colors.black54), title: Text('Carrito')),
            BottomNavigationBarItem(icon: Icon( Icons.person, color: Colors.black54), title: Text('Mi Cuenta')),
          ]
      ),
    );
  }

  _searchBtn() => Padding(
    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
    child: Container(
          decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24)
          ),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 14.0),
            child: Icon(Icons.search, color: Colors.black,),
          ),
          Padding(
            padding: const EdgeInsets.only(left:16.0, top: 4),
            child: Text('Buscar', style: TextStyle(color: Colors.grey, fontSize: 16.0),),
          )
        ],
      ),
    ),
  );
}

class Body extends StatelessWidget {
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
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.55,
        children: List.generate(product.length, (index){
          return ProductsListItem(product1: product[index]);
        }),
    );
  }


}
