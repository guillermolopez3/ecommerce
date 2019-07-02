import 'package:e_commerce/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import '../elegir_categoria.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';


class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  UserBloc _userBloc;

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of(context); // instancio mi clase Bloc
    return _handleCurrentSession(context);
  }

  //maneja el estado de la sesion y si esta logueado muestra la pantalla de categorias, si no el de signIn
  Widget _handleCurrentSession(BuildContext cont)
  {
    return StreamBuilder(
      stream:  _userBloc.authStatus,
      builder: (context, snapshot){
        //snapshot tiene nuestro objeto user
        if(! snapshot.hasData || snapshot.hasError){
          //si el usuario no esta logueado o me da error
          return signIn(cont);
        }
        else{
          return ElegirCategoria();
        }
      },
    );
  }

  Widget signIn(BuildContext context){
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                child: Align(
                    alignment: Alignment.topRight,
                    child: Image.asset('assets/img/img_top_login.jpg', height: 250, width: 200,)
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Bienvenido!!! Inicia sesión', style: TextStyle(fontSize: 24, color: Colors.grey),),
                    SizedBox(height: 20,),
                    GoogleSignInButton(
                      onPressed: (){
                        //Navigator.of(context).pushReplacementNamed('/categoria');
                        _userBloc.sigIn().then((user)=> print('El usuario logueado es ${user.displayName}'));
                      },
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
}
