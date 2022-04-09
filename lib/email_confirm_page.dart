import 'package:flutter/material.dart';

import 'change_password_page.dart';
import 'http_request.dart';

class EmailConfirmPage extends StatefulWidget {
  const EmailConfirmPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<EmailConfirmPage> createState() => _EmailConfirmPageState();
}


class _EmailConfirmPageState extends State<EmailConfirmPage> {

  final codeController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    codeController.dispose();
    super.dispose();
  }

  Future<void> send_code_to_server_func() async {
    String response = await send_code_to_server(codeController.text);

    if (response.compareTo('YES') == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChangePasswordPage(title: 'Home Page',)),
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
              controller: codeController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Code',
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: (){
                send_code_to_server_func();
              },
              child: const Text('Send Code'),
            ),
          ],
        ),
      ),
    );
  }
}
