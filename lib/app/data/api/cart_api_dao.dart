import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salgadar_app/app/models/cart.dart';
import 'package:salgadar_app/app/shared/utils/consts.dart';

class CartAPIDao {
  /// Post - adiciona um [Cart] e retorna [id] gerado.
  Future<int> postCart(Cart cart) async {
    // Variaveis auxiliares
    final url = Uri.parse(URL_CART);

    final headers = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final body = jsonEncode(cart.toJson());
    final response = await http.post(url, body: body, headers: headers);
    final jsonResponse = jsonDecode(response.body);

    return jsonResponse[CART_ID];
  }

  /// Put - atualiza um [Card].
  Future<Cart> putCart(Cart cart) async {
    // Variaveis auxiliares.
    final path = '/$TABLE_CART_NAME/${cart.id}';
    final url = Uri.http(AUTHORITY, path);

    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(cart.toJson()),
    );

    // Caso sucesso
    if (response.statusCode == 200) {
      return Cart.fromJson(json: jsonDecode(response.body));
    } else {
      throw Exception('Ocorreu uma falha no carregamento.');
    }
  }

  /// Get - busca todos [Cart].
  Future<List<Cart>> getCarts() async {
    // Variaveis auxiliares.
    final url = Uri.parse(URL_CART);

    final response = await http.get(url);

    // Caso sucesso.
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final carts = (jsonResponse as List)
          .map((data) => Cart.fromJson(json: data))
          .toList();

      return carts;
    } else {
      throw Exception('Ocorreu uma falha no carregamento.');
    }
  }

  /// Delete - remove um [Cart].
  Future<http.Response> deleteCart({int id}) async {
    // Variaveis auxiliares.
    final path = '/$TABLE_CART_NAME/$id';
    final url = Uri.http(AUTHORITY, path);

    final response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    return response;
  }

  /// Busca um [Cart].
  Future<Cart> getCart({id}) async {
    // Variaveis auxiliares.
    final path = '/$TABLE_CART_NAME';
    final queryParameters = {CART_ID: '$id'};
    final url = Uri.http(AUTHORITY, path, queryParameters);

    final response = await http.get(url);

    // Caso sucesso
    if (response.statusCode == 200) {
      return jsonDecode(response.body).toString() == '[]'
          ? null
          : Cart.fromJson(json: jsonDecode(response.body)[0]);
    } else {
      throw Exception('Ocorreu uma falha no carregamento.');
    }
  }

  /// Verifica se usuario contem [Cart].
  Future<bool> contains({int idCart}) async {
    // Variaveis auxiliares.
    final path = '/$TABLE_USER_NAME';
    final queryParameters = {CART_ID: '$idCart'};
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
