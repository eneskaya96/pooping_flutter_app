import 'dart:convert';

import 'package:http/http.dart' as http;

String base_url = 'http://127.0.0.1:5000';

Future<http.Response> send_request() async {
  final response = await http.get(
    Uri.parse(base_url),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return response;
  } else {
    throw Exception('Failed HTTP REQUEST');
  }
}


Future<String> send_login_request(email, password) async {

  var body = jsonEncode({ 'email': email,
                          'password': password} );

  final response = await http.post(
      Uri.parse(base_url + '/login'),
      body: body
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return response.body;
  } else {
    throw Exception('Failed HTTP REQUEST');
  }
}

Future<String> send_code_to_email(email) async {

  var body = jsonEncode({ 'email': email} );

  final response = await http.post(
      Uri.parse(base_url + '/send_code'),
      body: body
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return response.body;
  } else {
    throw Exception('Failed HTTP REQUEST');
  }
}

Future<String> send_code_to_server(code) async {

  var body = jsonEncode({ 'code': code} );

  final response = await http.post(
      Uri.parse(base_url + '/send_code_to_server'),
      body: body
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return response.body;
  } else {
    throw Exception('Failed HTTP REQUEST');
  }
}

Future<String> change_password_request(new_password) async {

  var body = jsonEncode({ 'new_password': new_password} );

  final response = await http.post(
      Uri.parse(base_url + '/change_password'),
      body: body
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return response.body;
  } else {
    throw Exception('Failed HTTP REQUEST');
  }
}

Future<String> create_user_request(email, password) async {

  var body = jsonEncode({ 'email': email,
                          'password': password} );

  final response = await http.post(
      Uri.parse(base_url + '/create_user'),
      body: body
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return response.body;
  } else {
    throw Exception('Failed HTTP REQUEST');
  }
}

Future<String> send_personal_info_request(name, gender, age) async {

  var body = jsonEncode({ 'name': name,
    'gender': gender,
    'age': age
  } );

  final response = await http.post(
      Uri.parse(base_url + '/send_personal_info'),
      body: body
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return response.body;
  } else {
    throw Exception('Failed HTTP REQUEST');
  }
}

Future<String> upload_photo_request(bio) async {

  var body = jsonEncode({ 'bio': bio} );

  final response = await http.post(
      Uri.parse(base_url + '/upload_photo_and_bio'),
      body: body
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return response.body;
  } else {
    throw Exception('Failed HTTP REQUEST');
  }
}

