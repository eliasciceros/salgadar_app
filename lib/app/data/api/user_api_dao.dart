import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salgadar_app/app/models/user.dart';
import 'package:salgadar_app/app/shared/utils/consts.dart';

class UserAPIDao {
  /// Post - adiciona um [User] e retorna [id] gerado.
  Future<int> postUser(User user) async {
    // Variaveis auxiliares
    final url = Uri.parse(URL_USER);

    final headers = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final body = jsonEncode(user.toJson());
    final response = await http.post(url, body: body, headers: headers);
    final jsonResponse = jsonDecode(response.body);

    return jsonResponse[USER_ID];
  }

  /// Put - atualiza um [Card].
  Future<User> putUser(User user) async {
    // Variaveis auxiliares.
    final path = '/$TABLE_USER_NAME/${user.id}';
    final url = Uri.http(AUTHORITY, path);

    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    // Caso sucesso
    if (response.statusCode == 200) {
      return User.fromJson(json: jsonDecode(response.body));
    } else {
      throw Exception('Ocorreu uma falha no carregamento.');
    }
  }

  /// Get - busca todos [User].
  Future<List<User>> getUsers() async {
    // Variaveis auxiliares.
    final url = Uri.parse(URL_USER);

    final response = await http.get(url);

    // Caso sucesso.
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final users = (jsonResponse as List)
          .map((data) => User.fromJson(json: data))
          .toList();

      return users;
    } else {
      throw Exception('Ocorreu uma falha no carregamento.');
    }
  }

  /// Delete - remove um [User].
  Future<http.Response> deleteUser({int id}) async {
    // Variaveis auxiliares.
    final path = '/$TABLE_USER_NAME/$id';
    final url = Uri.http(AUTHORITY, path);

    final response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    return response;
  }

  /// Busca um [User].
  Future<User> getUser({String username}) async {
    // Variaveis auxiliares.
    final path = '/$TABLE_USER_NAME';
    final queryParameters = {USER_USERNAME: username};
    final url = Uri.http(AUTHORITY, path, queryParameters);

    final response = await http.get(url);

    // Caso sucesso
    if (response.statusCode == 200) {
      return jsonDecode(response.body).toString() == '[]'
          ? null
          : User.fromJson(json: jsonDecode(response.body)[0]);
    } else {
      throw Exception('Ocorreu uma falha no carregamento.');
    }
  }

  /// Verifica se contem [User].
  Future<bool> contains({String username}) async {
    // Variaveis auxiliares.
    final path = '/$TABLE_USER_NAME';
    final queryParameters = {USER_USERNAME: username};
    final url = Uri.http(AUTHORITY, path, queryParameters);

    final response = await http.get(url);

    // Caso sucesso
    if (response.statusCode == 200) {
      return jsonDecode(response.body).toString() != '[]';
    } else {
      throw Exception('Ocorreu uma falha no carregamento.');
    }
  }
}
