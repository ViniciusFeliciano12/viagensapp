import 'package:flutter/material.dart';
import 'package:mybank_app/view/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const LoginPage(title: 'Login'),
    );
  }
}
