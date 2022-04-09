import 'package:flutter/material.dart';

import 'home_page.dart';
import 'http_request.dart';

class PhotoAndBioPage extends StatefulWidget {
  const PhotoAndBioPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PhotoAndBioPage> createState() => _PhotoAndBioPageState();
}


class _PhotoAndBioPageState extends State<PhotoAndBioPage> {

  final bio_controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    bio_controller.dispose();
    super.dispose();
  }

  Future<void> upload_photo() async {

    String response = await upload_photo_request(bio_controller.text
    );

    if (response.compareTo('YES') == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home Page')),
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
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Photo',
              ),
            ),
            TextField(
              controller: bio_controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Bio',
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: (){
                upload_photo();
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
