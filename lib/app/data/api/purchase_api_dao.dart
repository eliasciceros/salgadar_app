import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salgadar_app/app/models/purchase.dart';
import 'package:salgadar_app/app/shared/utils/consts.dart';

class PurchaseAPIDao {
  /// Post - adiciona um [Purchase].
  Future<int> postPurchase(Purchase purchase) async {
    // Variaveis auxiliares
    final url = Uri.parse(URL_PURCHASE);

    final headers = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final body = jsonEncode(purchase.toJson());
    final response = await http.post(url, body: body, headers: headers);
    final jsonResponse = jsonDecode(response.body);

    return jsonResponse[PURCHASE_ID];
  }

  /// Put - atualiza um [Card].
  Future<Purchase> putPurchase(Purchase purchase) async {
    // Variaveis auxiliares.
    final path = '/$TABLE_PURCHASE_NAME/${purchase.id}';
    final url = Uri.http(AUTHORITY, path);

    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(purchase.toJson()),
    );

    // Caso sucesso
    if (response.statusCode == 200) {
      return Purchase.fromJson(json: jsonDecode(response.body));
    } else {
      throw Exception('Ocorreu uma falha no carregamento.');
    }
  }

  /// Get - busca todos [Purchase].
  Future<List<Purchase>> getPurchases() async {
    // Variaveis auxiliares.
    final url = Uri.parse(URL_PURCHASE);

    final response = await http.get(url);

    // Caso sucesso.
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      // Recupera apenas as que nao estao deletadas.
      final jsonResponseList = jsonResponse as List;
      final purchases = <Purchase>[];
      for (var i = 0; i < jsonResponseList.length; i++) {
        if (jsonResponseList[i][PURCHASE_ISDELETED] == 0) {
          purchases.add(Purchase.fromJson(json: jsonResponseList[i]));
        }
      }

      return purchases;
    } else {
      throw Exception('Ocorreu uma falha no carregamento.');
    }
  }

  /// Delete - remove um [Purchase].
  Future<http.Response> deletePurchase({int id}) async {
    // Variaveis auxiliares.
    final path = '/$TABLE_PURCHASE_NAME/$id';
    final url = Uri.http(AUTHORITY, path);

    final response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    return response;
  }

  /// Busca um [Purchase].
  Future<Purchase> getPurchase({int id}) async {
    // Variaveis auxiliares.
    final path = '/$TABLE_PURCHASE_NAME';
    final queryParameters = {PURCHASE_ID: '$id'};
    final url = Uri.http(AUTHORITY, path, queryParameters);

    final response = await http.get(url);

    // Caso sucesso
    if (response.statusCode == 200) {
      return jsonDecode(response.body).toString() == '[]'
          ? null
          : Purchase.fromJson(json: jsonDecode(response.body));
    } else {
      throw Exception('Ocorreu uma falha no carregamento.');
    }
  }

  /// Busca um [Purchase].
  Future<List<Purchase>> getUserPurchases({int userId, bool getDeleted}) async {
    // Variaveis auxiliares.
    final path = '/$TABLE_PURCHASE_NAME';
    final queryParameters = {
      PURCHASE_USERID: "$userId",
      PURCHASE_ISDELETED: getDeleted ? "1" : "0"
    };
    final url = Uri.http(AUTHORITY, path, queryParameters);

    final response = await http.get(url);

    // Caso sucesso
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      // Recupera apenas as que nao estao deletadas.
      final purchases = (jsonResponse as List)
          .map((data) => Purchase.fromJson(json: data))
          .toList();

      return purchases;
    } else {
      throw Exception('Ocorreu uma falha no carregamento.');
    }
  }

  /// Verifica se usuario contem [Purchase].
  Future<bool> contains({int idPurchase}) async {
    // Variaveis auxiliares.
    final path = '/$TABLE_USER_NAME';
    final queryParameters = {PURCHASE_ID: '$idPurchase'};
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
