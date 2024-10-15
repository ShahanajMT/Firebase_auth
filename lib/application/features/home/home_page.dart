import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userauth_firebase/application/features/auth/auth_bloc/auth_bloc.dart';

class HomePageWrapper extends StatelessWidget {
  const HomePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: Center(
        child: MaterialButton(onPressed: () {
          final auth = BlocProvider.of<AuthBloc>(context);
          auth.add(LogOutEvent());
          Navigator.of(context).pushNamedAndRemoveUntil( '/login', (route) => false);
        } , child: const Icon(Icons.logout),),
      ),
    );
  }
}
