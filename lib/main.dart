import 'package:flutter/material.dart';

import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pooping',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const LoginPage(title: 'Pooping'),
    );
  }
}
