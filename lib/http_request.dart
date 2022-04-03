

import 'package:http/http.dart' as http;

Future<http.Response> send_request() async {
  final response = await http.get(
    Uri.parse('http://127.0.0.1:5000'),
  );

  print(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return response;
  } else {
    throw Exception('Failed HTTP REQUEST');
  }
}