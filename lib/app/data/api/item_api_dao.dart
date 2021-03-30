import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salgadar_app/app/models/item.dart';
import 'package:salgadar_app/app/shared/utils/consts.dart';

class ItemAPIDao {
  /// Post - adiciona um [Item] e retorna [id] gerado.
  Future<int> postItem(Item item) async {
    // Variaveis auxiliares
    final url = Uri.parse(URL_ITEM);

    final headers = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final body = jsonEncode(item.toJson());
    final response = await http.post(url, body: body, headers: headers);
    final jsonResponse = jsonDecode(response.body);

    return jsonResponse[ITEM_ID];
  }

  /// Put - atualiza um [Card].
  Future<Item> putItem(Item item) async {
    // Variaveis auxiliares.
    final path = '/$TABLE_ITEM_NAME/${item.id}';
    final url = Uri.http(AUTHORITY, path);

    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(item.toJson()),
    );

    // Caso sucesso
    if (response.statusCode == 200) {
      return Item.fromJson(json: jsonDecode(response.body));
    } else {
      throw Exception('Ocorreu uma falha no carregamento.');
    }
  }

  /// Get - busca todos [Item].
  Future<List<Item>> getItems() async {
    // Variaveis auxiliares.
    final url = Uri.parse(URL_ITEM);

    final response = await http.get(url);

    // Caso sucesso.
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final items = (jsonResponse as List)
          .map((data) => Item.fromJson(json: data))
          .toList();

      return items;
    } else {
      throw Exception('Ocorreu uma falha no carregamento.');
    }
  }

  /// Delete - remove um [Item].
  Future<http.Response> deleteItem({int id}) async {
    // Variaveis auxiliares.
    final path = '/$TABLE_ITEM_NAME/$id';
    final url = Uri.http(AUTHORITY, path);

    final response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    return response;
  }

  /// Busca um [Item].
  Future<Item> getItem({int id}) async {
    // Variaveis auxiliares.
    final path = '/$TABLE_ITEM_NAME/$id';
    final url = Uri.http(AUTHORITY, path);

    final response = await http.get(url);

    // Caso sucesso
    if (response.statusCode == 200) {
      return jsonDecode(response.body).toString() == '[]'
          ? null
          : Item.fromJson(json: jsonDecode(response.body));
    } else {
      throw Exception('Ocorreu uma falha no carregamento.');
    }
  }

  /// Verifica se o usuario contem [Item].
  Future<bool> contains({int idItem}) async {
    // Variaveis auxiliares.
    final path = '/$TABLE_USER_NAME';
    final queryParameters = {ITEM_ID: '$idItem'};
    final url = Uri.http(AUTHORITY, path, queryParameters);

    final response = await http.get(url);

    // Caso sucesso
    if (response.statusCode == 200) {
      return jsonDecode(response.body).toString() != '[]';
    } else {
      throw Exception('Ocorreu uma falha no carregamento.');
    }
  }

  /// Get - busca todos [Item] por categoria.
  Future<List<Item>> getItemsByCategory({String category}) async {
    // Variaveis auxiliares.
    final path = '/$TABLE_ITEM_NAME';
    final queryParameters = {ITEM_CATEGORY: category};
    final url = Uri.http(AUTHORITY, path, queryParameters);

    final response = await http.get(url);

    // Caso sucesso.
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final items = (jsonResponse as List)
          .map((data) => Item.fromJson(json: data))
          .toList();

      return items;
    } else {
      throw Exception('Ocorreu uma falha no carregamento.');
    }
  }

  /// Get - busca todos [Item] por subcategoria.
  Future<List<Item>> getItemsBySubCategory({String subCategory}) async {
    // Variaveis auxiliares.
    final path = '/$TABLE_ITEM_NAME';
    final queryParameters = {ITEM_SUBCATEGORY: subCategory};
    final url = Uri.http(AUTHORITY, path, queryParameters);

    final response = await http.get(url);

    // Caso sucesso.
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final items = (jsonResponse as List)
          .map((data) => Item.fromJson(json: data))
          .toList();

      return items;
    } else {
      throw Exception('Ocorreu uma falha no carregamento.');
    }
  }
}
