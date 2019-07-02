import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


//implementa toda la logica de conexion con firebase Auth

class FirebaseAuthAPI
{
  final FirebaseAuth _auth = FirebaseAuth.instance; //obtengo la instancia
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // maneja la logica del sigIn, obteniendo los datos de Firebase con el usuario logueado
  Future<FirebaseUser> signIn() async{

    //muestro la ventana de dialogo para que diga con que cuenta se quiere autenticar
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();

    //obtengo las credenciales
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    //Una vez que ya estoy autenticado en google, lo hago en firebase
    FirebaseUser user = await _auth.signInWithCredential(
      GoogleAuthProvider.getCredential(idToken: gSA.idToken, accessToken: gSA.accessToken)
    );

    return user;
  }
}