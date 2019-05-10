import 'package:flutter/material.dart';


class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _inputSearch(),
        actions: <Widget>[
          IconButton(icon: IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: (){}),)
        ],
      ),
      body: Center(
        child: Text('No hay búsquedas'),
      ),
    );
  }

  //TODO agregar una X al final del TextFild para eliminar lo escrito
  _inputSearch()=> TextField(
    decoration: InputDecoration(
      hintText: 'Buscar',
      hintStyle: TextStyle(color: Colors.grey[400])
    ),
    style: TextStyle(color: Colors.white),
    autofocus: true,
    cursorColor: Colors.white,
  );

}
