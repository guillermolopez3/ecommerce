import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:e_commerce/repository/auth_repository.dart';

//los datos los obtengo de los repository, aca aparecen los casos de usos de la app o logica del negocio y los Bloc son los que se
// conectan con la UI
class UserBloc implements Bloc{

  final _authRepository = AuthRepository();

  //monitoreo el estado de la sesion con Stream para que reaccione ante un cambio de estado del logueo
  Stream<FirebaseUser> _streamFirebase = FirebaseAuth.instance.onAuthStateChanged; //devuelve un straem
  Stream<FirebaseUser> get authStatus => _streamFirebase; //para acceder desde afuera devolviendo el estado de la sesion

  //primer CU, signIn con Google
  //el nombre del metodo es generico signIn ya que esta clase no le importa con que metodo hacemos signIn (face, google...)
  Future<FirebaseUser> sigIn() => _authRepository.signInFirebase();


  @override
  void dispose() {

  }
}