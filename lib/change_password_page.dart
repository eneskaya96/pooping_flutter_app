import 'package:flutter/material.dart';
import 'http_request.dart';
import 'login_page.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}


class _ChangePasswordPageState extends State<ChangePasswordPage> {

  final password_controller = TextEditingController();
  final re_password_controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    password_controller.dispose();
    re_password_controller.dispose();
    super.dispose();
  }

  Future<void> change_password() async {

    if (password_controller.text != re_password_controller.text){
      return;
    }
    String response = await change_password_request(password_controller.text);

    if (response.compareTo('YES') == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage(title: 'Login Page',)),
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
                change_password();
              },
              child: const Text('Change Password'),
            ),
          ],
        ),
      ),
    );
  }
}
