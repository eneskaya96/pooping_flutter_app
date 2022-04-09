import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home_page.dart';
import 'http_request.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}


class _SignUpPageState extends State<SignUpPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future<http.Response>? _futureData;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'E-mail',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home Page',)),
                );
              },
              child: const Text('Log In'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home Page',)),
                );
              },
              child: const Text('Sign Up'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      // Retrieve the text the that user has entered by using the
                      // TextEditingController.
                      content: Text(emailController.text),
                    );
                  },
                );
              },
              child: const Text('Show Email'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _futureData = send_request();
                });
              },
              child: const Text('Http request'),
            ),
          ],
        ),
      ),
    );
  }
}
