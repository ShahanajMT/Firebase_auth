import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userauth_firebase/application/features/auth/auth_bloc/auth_bloc.dart';
import 'package:userauth_firebase/application/features/auth/widgets/customtextFormFeild.dart';

class LoginPageWrapper extends StatelessWidget {
  const LoginPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //! ----
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final authBloc = BlocProvider.of<AuthBloc>(context);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        // if (state is AuthLoading) {
        //   return const CircularProgressIndicator(color: Colors.indigo,);
        // }
          if (state is Authenticated) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacementNamed('/home');
          });
        }
        return Scaffold(
            body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login with Email",
                  style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(height: 20),
              CustomTextFormField(
                  controller: _emailController, hintText: "exampel@gmail.com"),
              const SizedBox(
                height: 13,
              ),
              CustomTextFormField(
                  controller: _passwordController,
                  hintText: "password",
                  obscureText: true),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  authBloc.add(
                    LoginEvent(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                    ),
                  );
                },
                child: Container(
                  height: height * 0.05,
                  width: width * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.red),
                  //decoration: Boxdecoration(),
                  child: Center(
                    child: Text(
                      "LogIn",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("New here?"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed("/register");
                      },
                      child: Text(
                        "Register",
                        style: Theme.of(context).textTheme.bodySmall,
                      ))
                ],
              )
            ],
          ),
        ));
      },
    );
  }
}
