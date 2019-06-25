import 'package:flutter/material.dart';

class CategoriaDetalle extends StatelessWidget {
  String titlulo;

  CategoriaDetalle({this.titlulo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          titlulo,
          style: TextStyle(
              color: Colors.black
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.filter_list), color: Colors.black , onPressed: (){})
        ] ,
      ),
      body: _body(),
    );
  }

  Widget _body(){
      return Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            _listItem('Juan Perez','Plomero','Centro, Argüello, Rio Ceballos'),
            _listItem('Juan Perez','Plomero','Centro, Argüello, Rio Ceballos'),
            _listItem('Juan Perez','Plomero','Centro, Argüello, Rio Ceballos'),
            _listItem('Juan Perez','Plomero','Centro, Argüello, Rio Ceballos'),
            _listItem('Juan Perez','Plomero','Centro, Argüello, Rio Ceballos'),
            _listItem('Juan Perez','Plomero','Centro, Argüello, Rio Ceballos'),
            _listItem('Juan Perez','Plomero','Centro, Argüello, Rio Ceballos'),
            _listItem('Juan Perez','Plomero','Centro, Argüello, Rio Ceballos')
          ],
        ),
      );
  }

  Widget _listItem(String nombre, String descripcion, String zonas){
    return Container(
      child: Card(
        color: Colors.white,
        elevation: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 120,
              height: 150,
              child: _imagenYReputacion()
            ),
            SizedBox(width: 14),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top:8.0, bottom: 4, right: 4),
                    child: Text(
                      nombre,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0
                      ),
                    ),
                  ),
                  Text(
                      descripcion,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.0),
                  RichText(
                    maxLines: 3,
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Zonas trabajo: ',
                            style: new TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: zonas),
                      ]
                    ),
                  )
                ],
              ),
            )
          ],
        ),

      ),
    );
  }

  _imagenYReputacion()=> Column(
    children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/img/perfil.jpg',
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.star, color: Colors.yellow,),
            Text(
              '4,5',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            SizedBox(width: 5.0,),
            Icon(Icons.phone),
            Text(
              '20',
              style: TextStyle(fontWeight: FontWeight.w400),
            )
          ],
        ),
      )
    ],
  );
}
