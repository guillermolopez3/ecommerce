import 'package:flutter/material.dart';
import 'model/app_state_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'model/product.dart';
import 'item_list_product.dart';
import 'search.dart';
import 'category_filter.dart';
import 'favoritos/ui/favoritos_screen.dart';
import 'carrito/carrito_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;
  final List<Widget> _body = [Body(),FavoritoScreen(),Carrito()];
  final List<String> _tituloAppBar = ['Mis Favoritos', 'Carrito', 'Perfil'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _index ==0 ? _appBarWithSearch() : _simpleAppBar(),
      body: _body[_index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: _onTapped,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.blue,
          items: [
            BottomNavigationBarItem(icon: Icon( Icons.home, ), title:  Padding(padding: EdgeInsets.all(0))),
            BottomNavigationBarItem(icon: Icon( Icons.favorite,), title:  Padding(padding: EdgeInsets.all(0))),
            BottomNavigationBarItem(icon: _iconCarritoConProductos(), title:  Padding(padding: EdgeInsets.all(0))),
            BottomNavigationBarItem(icon: Icon( Icons.person), title:  Padding(padding: EdgeInsets.all(0))),
          ]
      ),
    );
  }

  //apBar con el filtro y con la busqueda, aparece solo cuando estoy en el index 0
  AppBar _appBarWithSearch()
  {
    return AppBar(
      title: _searchBtn(context),
      actions: <Widget>[
        IconButton(icon: IconButton(icon: Icon(Icons.filter_list, color: Colors.white,), onPressed: (){
          Navigator.of(context).push(PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) =>
                  CategoryMenuPage(onCategoryTap: ()=> Navigator.pop(context),)
          )
          );
        }),
        )
      ],
    );
  }

  AppBar _simpleAppBar()
  {
    return AppBar(
      title: Text(_tituloAppBar[_index - 1]),
    );
  }

  void _onTapped(int index)
  {
      setState(() {
        _index = index;
      });
  }

  //agrego al icono del carrito un circulo indicador de cant de items agregados o ninguno
  _iconCarritoConProductos()=> Stack(
    children: <Widget>[
      Icon( Icons.shopping_cart),
      ScopedModelDescendant<AppStateModel>(
        builder: (context, child, model){
          int cant = model.totalCartQuantity;
          if(cant > 0) {
            return _buildIconCart(cant);
          }
          else{
            return Positioned(
              right: 0,
              child: Container(),
            );
          }
        },
      ),

    ],
  );

  //dibujo sobre el icono un circulo rojo con la cantidad de productos agregados al carrito
  _buildIconCart(int cant) => Positioned(
    right: 0,
    child: Container(
      padding: EdgeInsets.all(1.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.red
      ),
      constraints: BoxConstraints(
          minHeight: 12,
          minWidth: 12
      ),
      child: Text('$cant', style: TextStyle(color: Colors.white, fontSize: 8.0), textAlign: TextAlign.center,),
    ),
  );

  //custom search bar que al hacer click te lleva a otra pantalla
  _searchBtn(context) => InkWell(
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Search()));
    },
    child: Padding(
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
    ),
  );


}

// cuerpo del home
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

  _buildListView(){
    return ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: product.length,
        itemBuilder: (context, index){
            return ItemListProducts(product: product[index]);
        }
    );
  }


}



