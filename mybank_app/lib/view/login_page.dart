import 'package:flutter/material.dart';
import 'package:mybank_app/bloc/login_page/login_bloc.dart';
import 'package:mybank_app/bloc/login_page/login_event.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordObscure = true;

  late final LoginBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Stack(clipBehavior: Clip.hardEdge, children: [
            Image.asset("assets/background.jpg"),
            _body(context),
          ]),
        ));
  }

  Center _body(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 200, left: 50),
        child: SizedBox(
          height: 260,
          width: 250,
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(right: 50),
                child: Text('Usuário '),
              ),
              const SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: TextField(
                  controller: userController,
                ),
              ),
              const SizedBox(height: 19),
              const Padding(
                padding: EdgeInsets.only(right: 50),
                child: Text('Senha: '),
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: passwordController,
                      obscureText: passwordObscure,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          passwordObscure = !passwordObscure;
                        });
                      },
                      icon: const Icon(Icons.remove_red_eye_outlined))
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: ElevatedButton(
                    onPressed: () {
                      bloc.add(TryLoginEvent(
                          context: context,
                          username: userController.text,
                          password: passwordController.text));
                      userController.clear();
                      passwordController.clear();
                    },
                    child: const Text('Login')),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: ElevatedButton(
                    onPressed: () {
                      bloc.add(GoToRegisterEvent(context: context));
                    },
                    child: const Text('Register')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
