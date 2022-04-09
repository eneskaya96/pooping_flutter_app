import 'package:flutter/material.dart';

import 'email_confirm_page.dart';
import 'http_request.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}


class _SignUpPageState extends State<SignUpPage> {

  final email_controller = TextEditingController();
  final password_controller = TextEditingController();
  final re_password_controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    email_controller.dispose();
    password_controller.dispose();
    re_password_controller.dispose();
    super.dispose();
  }

  Future<void> create_user() async {

    if (password_controller.text != re_password_controller.text){
      return;
    }
    String response = await create_user_request(email_controller.text,
        password_controller.text);

    if (response.compareTo('YES') == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const EmailConfirmPage(title: 'Email Confirm Page',
          previous_page: 'SignUpPage',)),
      );
    }
    else {
      print("Can not login ");
    }
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
              controller: email_controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'E-mail',
              ),
            ),
            TextField(
              controller: password_controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
            ),
            TextField(
              controller: re_password_controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Re-Password',
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: (){
                create_user();
              },
              child: const Text('Sig Up'),
            ),
          ],
        ),
      ),
    );
  }
}
