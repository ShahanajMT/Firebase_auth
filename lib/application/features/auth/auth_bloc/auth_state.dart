// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState{}

// ignore: must_be_immutable
class Authenticated extends AuthState {
  User? user;
  Authenticated({
    this.user,
  });
}

class UnAuthenticate extends AuthState {}

class AuthenticatedError extends AuthState {
  final String message;

  AuthenticatedError({required this.message});
}






