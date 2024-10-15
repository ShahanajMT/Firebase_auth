import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:userauth_firebase/application/features/auth/models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthBloc() : super(AuthInitial()) {
    on<CheckLoginStatusEvent>(
      (event, emit) async {
        User? user;
        try {
          await Future.delayed(const Duration(seconds: 1), () {
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
      },
    );

    //! ======== SignUp ========= !//

    on<SigupEvent>(
      (event, emit) async {
        emit(AuthLoading());

        try {
          final userCredential = await _auth.createUserWithEmailAndPassword(
              email: event.user.email.toString(),
              password: event.user.password.toString());
          final user = userCredential.user;

          if (user != null) {
            FirebaseFirestore.instance.collection("users").doc(user.uid).set({
              'uid': user.uid,
              'email': user.email,
              'name': event.user.name,
              'phone': event.user.phone,
              'createdAt': DateTime.now(),
            });
            emit(Authenticated(user: user));
          } else {
            emit(UnAuthenticate());
          }
        } catch (e) {
          emit(AuthenticatedError(message: e.toString()));
        }
      },
    );

    //! ======= LogOut ============ !//

    on<LogOutEvent>(
      (event, emit) async {
        try {
          await _auth.signOut();
          emit(UnAuthenticate());
        } catch (e) {
          emit(AuthenticatedError(message: e.toString()));
        }
      },
    );

    //! ======= LogIn  ========== !/
    on<LoginEvent> ((event, emit) async {
      emit(AuthLoading());
      try {
        final userCredential = await _auth.signInWithEmailAndPassword(email: event.email, password: event.password);
        final user = userCredential.user;

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
