import 'dart:convert';

import 'package:http/http.dart' as http;

String base_url = 'http://127.0.0.1:5000';

Future<String> send_request(body, end_point,  is_post) async {
  final http.Response response;
  String url = base_url + end_point;

  if(is_post){
    response = await http.post(Uri.parse(url),body: body);
  }
  else {
    response = await http.get(Uri.parse(url),);
  }

  if (response.statusCode == 200) { return response.body;}
  else {throw Exception('Failed HTTP REQUEST');}
}


Future<String> send_login_request(email, password) async {
  var body = jsonEncode({ 'email': email,
                          'password': password} );
  return send_request(body, '/login', true);
}

Future<String> send_code_to_email(email) async {
  var body = jsonEncode({ 'email': email} );
  return send_request(body, '/send_code', true);
}

Future<String> send_code_to_server(code) async {
  var body = jsonEncode({ 'code': code} );
  return send_request(body, '/send_code_to_server', true);
}

Future<String> change_password_request(new_password) async {
  var body = jsonEncode({ 'new_password': new_password} );
  return send_request(body, '/change_password', true);
}

Future<String> create_user_request(email, password) async {
  var body = jsonEncode({ 'email': email,
                          'password': password} );
  return send_request(body, '/create_user', true);
}

Future<String> send_personal_info_request(name, gender, age) async {
  var body = jsonEncode({ 'name': name,
    'gender': gender,
    'age': age
  } );
  return send_request(body, '/send_personal_info', true);
}

Future<String> upload_photo_request(bio) async {
  var body = jsonEncode({ 'bio': bio} );
  return send_request(body, '/upload_photo_and_bio', true);
}

