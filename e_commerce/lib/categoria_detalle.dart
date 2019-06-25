import 'package:flutter/material.dart';
import 'perfil.dart';
import 'dart:math';

class CategoriaDetalle extends StatelessWidget {
  String titlulo;
  BuildContext context;

  CategoriaDetalle({this.titlulo});

  @override
  Widget build(BuildContext context) {
    this.context = context;
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
          IconButton(icon: Icon(Icons.filter_list), color: Colors.black , onPressed: (){
            Navigator.of(context).push(PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, _, __) =>
                    Filtro()
            )
            );
          })
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
            _listItem('Juan Perez','Plomero','Centro, Argüello, Rio Ceballos',1),
            _listItem('Juan Perez','Plomero','Centro, Argüello, Rio Ceballos',2),
            _listItem('Juan Perez','Plomero','Centro, Argüello, Rio Ceballos',3),
            _listItem('Juan Perez','Plomero','Centro, Argüello, Rio Ceballos',4),
            _listItem('Juan Perez','Plomero','Centro, Argüello, Rio Ceballos',5),
            _listItem('Juan Perez','Plomero','Centro, Argüello, Rio Ceballos',6),
            _listItem('Juan Perez','Plomero','Centro, Argüello, Rio Ceballos',7),
            _listItem('Juan Perez','Plomero','Centro, Argüello, Rio Ceballos',8)
          ],
        ),
      );
  }

  Widget _listItem(String nombre, String descripcion, String zonas, int nroHero){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Perfil(name: nombre,nroHero: nroHero,)));
      },
      child: Container(
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
                child: _imagenYReputacion(nroHero)
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
      ),
    );
  }

  _imagenYReputacion(int nroH)=> Column(
    children: <Widget>[
      Hero(
        tag: nroH,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/img/perfil.jpg',
            height: 100,
            fit: BoxFit.cover,
          ),
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


class Filtro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.90),
      body: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: IconButton(icon: Icon(Icons.clear), color: Colors.white, onPressed: (){ Navigator.pop(context);}),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          SizedBox(height: 16.0),
                          Text(
                            'REPUTACIÓN',
                            style: Theme.of(context).textTheme.body2.copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 14.0),
                          Container(
                            width: 70.0,
                            height: 2.0,
                            color: Colors.blue,
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            'MAS CONTACTADO',
                            style: Theme.of(context).textTheme.body2.copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            'MAS CERCANO',
                            style: Theme.of(context).textTheme.body2.copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    ],
                  ),

                )
              ],
            ),
          )),
    );
  }
}
