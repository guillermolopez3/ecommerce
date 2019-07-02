import 'package:flutter/material.dart';
import 'package:e_commerce/screens/login.dart';
import 'package:e_commerce/elegir_categoria.dart';


class Routes{

  static Route<dynamic> generarRutas(RouteSettings settings){
    switch(settings.name){
      case '/login':
        return MaterialPageRoute(builder: (_) => LogIn());
      case '/categoria':
        return MaterialPageRoute(builder: (_) => ElegirCategoria());
    }
  }


}