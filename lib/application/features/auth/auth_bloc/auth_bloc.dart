import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:userauth_firebase/application/features/auth/models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthBloc() : super(AuthInitial()) {
    on<CheckLoginStatusEvent>((event, emit) async{
      User? user;
      try {
        await Future.delayed(const Duration(seconds: 1),() {
          user = _auth.currentUser;
        });
        if (user != null) {
          emit(Authenticated(user: user));
        } else {
          emit(UnAuthenticate());
        }
      } catch (e) {
        emit(AuthenticatedError(message: e.toString()));
      }
    });
  }
}
