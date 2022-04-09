import 'package:flutter/material.dart';
import 'package:pooping_flutter_app/photo_and_bio_page.dart';

import 'email_confirm_page.dart';
import 'http_request.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}


class _PersonalInfoPageState extends State<PersonalInfoPage> {

  final name_controller = TextEditingController();
  final gender_controller = TextEditingController();
  final age_controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    name_controller.dispose();
    gender_controller.dispose();
    age_controller.dispose();
    super.dispose();
  }

  Future<void> send_personal_info() async {

    String response = await send_personal_info_request(name_controller.text,
        gender_controller.text,
        age_controller.text
    );

    if (response.compareTo('YES') == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PhotoAndBioPage(title: 'Photo And Bio Page',)),
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
              controller: name_controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
              ),
            ),
            TextField(
              controller: gender_controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Gender',
              ),
            ),
            TextField(
              controller: age_controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Age',
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: (){
                send_personal_info();
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
