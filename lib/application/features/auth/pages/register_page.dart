import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userauth_firebase/application/features/auth/auth_bloc/auth_bloc.dart';
import 'package:userauth_firebase/application/features/auth/models/user_model.dart';
import 'package:userauth_firebase/application/features/auth/widgets/customtextFormFeild.dart';

class RegisterPageWeapper extends StatelessWidget {
  const RegisterPageWeapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //! ----
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNoController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final authBloc = BlocProvider.of<AuthBloc>(context);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacementNamed('/home');
          });
        }
        return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              backgroundColor: Colors.grey,
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Register with Email",
                      style: Theme.of(context).textTheme.displayLarge),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                      controller: _emailController,
                      hintText: "exampel@gmail.com"),
                  const SizedBox(
                    height: 13,
                  ),
                  CustomTextFormField(
                      controller: _passwordController,
                      hintText: "password",
                      obscureText: true),
                  const SizedBox(
                    height: 13,
                  ),
                  CustomTextFormField(
                      controller: _nameController, hintText: "Enter a name"),
                  const SizedBox(
                    height: 13,
                  ),
                  CustomTextFormField(
                      controller: _phoneNoController, hintText: "Enter a no"),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      UserModel user = UserModel(
                        name: _nameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                        phone: _phoneNoController.text,
                      );

                      authBloc.add(SigupEvent(user: user));
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
                          "Register",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account"),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed("/login");
                          },
                          child: Text(
                            "LogIn",
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
