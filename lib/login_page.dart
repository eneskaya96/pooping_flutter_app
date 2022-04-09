import 'package:flutter/material.dart';
import 'package:pooping_flutter_app/sign_up_page.dart';

import 'forget_password_page.dart';
import 'home_page.dart';
import 'http_request.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> send_login_info() async {
    String response = await send_login_request(emailController.text,
        passwordController.text);

    if (response.compareTo('YES') == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home Page',)),
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
                send_login_info();
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
                  MaterialPageRoute(builder: (context) => const SignUpPage(title: 'Sign Up Page',)),
                );
              },
              child: const Text('Sign Up'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 10),
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ForgetPasswordPage(title: 'Forget Password Page',)),
                );
              },
              child: const Text('forget password'),
            ),
          ],
        ),
      ),
    );
  }
}
