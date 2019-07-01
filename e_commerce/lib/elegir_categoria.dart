import 'package:flutter/material.dart';
import 'widget/search.dart';
import 'categoria_detalle.dart';


class ElegirCategoria extends StatelessWidget {
  BuildContext mContext;

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '¿Qué Necesitás?',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: _body(),
    );
  }

  Widget _body(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 8.0),
        SearchButtom(),
        Padding(
          padding: const EdgeInsets.only(left:10.0, right: 10.0),
          child: Text(
            'Categorias principales',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20.0,
              fontWeight: FontWeight.w800
            ),
          ),
        ),
        _listaCategoriasPrincipales(),
        Padding(
          padding: const EdgeInsets.only(left:10.0, right: 10.0),
          child: Text(
            'Todas las categorías',
            style: TextStyle(
                color: Colors.grey,
                fontSize: 20.0,
                fontWeight: FontWeight.w800
            ),
          ),
        ),
        _listaCompleta()
      ],
    );
  }


  //ListView con las categorias principales
  Widget _listaCategoriasPrincipales(){
    return Container(
      padding: EdgeInsets.all(10.0),
      height: 120.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _listItemCategoria('electricista', 'Electricista'),
          _listItemCategoria('gasista', 'Gasista'),
          _listItemCategoria('plomero', 'Plomero'),
          _listItemCategoria('servicio_tecnico', 'Técnico'),
        ],
      ),
    );
  }

  //Items de la categoría principal
  _listItemCategoria(String path_img, String titulo){
    return Container(
      width: 100,
      child: Card(
        color: Colors.white,
        elevation: 4.0,
        child: InkWell(
          onTap: (){
            Navigator.push(mContext, MaterialPageRoute(builder: (context)=>CategoriaDetalle(titlulo: titulo)));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  child: Image.asset('assets/img/${path_img}.png'),
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 14),
                Text(
                  titulo,
                  style: TextStyle(
                    fontWeight: FontWeight.w600
                  ),
                )
              ],
            ),
          ),
        ),

      ),
    );
  }

  _listaCompleta(){
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            _listItemTodasLascategorias('Albañil'),
            _listItemTodasLascategorias('Arquitecto'),
            _listItemTodasLascategorias('Carpintero'),
            _listItemTodasLascategorias('Cerrajero'),
            _listItemTodasLascategorias('Cocinero'),
            _listItemTodasLascategorias('Decoradores'),
            _listItemTodasLascategorias('Vidriero'),
            _listItemTodasLascategorias('Mascotas'),
            _listItemTodasLascategorias('Pintor'),
          ],
        ),
      ),
    );
  }

  _listItemTodasLascategorias(String titulo) {
    return Container(
      height: 80,
      child: Card(
        color: Colors.white,
        elevation: 0.0,
        child: InkWell(
          onTap: (){
            Navigator.push(mContext, MaterialPageRoute(builder: (context)=>CategoriaDetalle(titlulo: titulo)));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  child: Image.asset('assets/img/dummy_people.png'),
                  backgroundColor: Colors.white,
                ),
                SizedBox(width: 14),
                Text(
                  titulo,
                  style: TextStyle(
                      fontWeight: FontWeight.w600
                  ),
                )
              ],
            ),
          ),
        ),

      ),
    );
  }

}
