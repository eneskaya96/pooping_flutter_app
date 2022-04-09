import 'package:flutter/material.dart';

import 'email_confirm_page.dart';
import 'http_request.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}


class _ForgetPasswordPageState extends State<ForgetPasswordPage> {

  final emailController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }

  Future<void> send_code() async {
    String response = await send_code_to_email(emailController.text);

    if (response.compareTo('YES') == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const EmailConfirmPage(title: 'Email Confirm Page',)),
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
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: (){
                send_code();
              },
              child: const Text('Send Code'),
            ),
          ],
        ),
      ),
    );
  }
}
