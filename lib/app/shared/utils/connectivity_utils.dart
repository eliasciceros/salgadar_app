import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'alert_dialog_utils.dart';
import 'consts.dart';

class ConnectivityUtils {
  /// Retorna a flag de conexao com internet.
  static Future<bool> hasInternetConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    switch (connectivityResult) {
      case ConnectivityResult.wifi: // Wi-fi.
      case ConnectivityResult.mobile: // Rede movel.
        return true;
        break;
      default:
        return false; // Sem acesso a internet.
        break;
    }
  }

  /// Retorna uma flag para conexao com o JSON server.
  static Future<bool> hasServerConnectivity(
      {@required BuildContext context}) async {
    // Auxiliary variables.
    final url = Uri.parse(URL_BASE);

    try {
      await http.get(url);
      // Success (statusCode = 200).
      return true;
    } catch (e) {
      // Connection timed out (errno = 110).
      serverNoConnectionErrorMessage(context: context);
      return false;
    }
  }

  /// [AlertDialog] de falha na conexao.
  static noConnectionMessage({@required BuildContext context}) {
    showAlertDialog(
        context: context,
        title: 'Falha na conexao com a internet!',
        message:
            'Por favor, verifique sua conexao com a internet e tente novamente.',
        buttonConfirmationLabel: 'ok');
  }

  /// [AlertDialog] de erro no carregamento.
  static loadErrorMessage({@required BuildContext context}) {
    showAlertDialog(
        context: context,
        title: 'Falha no carregamento!',
        message: 'Ocorreu um erro inesperado no carregamento. Por favor, tente '
            'novamente.',
        buttonConfirmationLabel: 'ok');
  }

  /// [AlertDialog] de erro no carregamento.
  static serverNoConnectionErrorMessage({@required BuildContext context}) {
    showAlertDialog(
        context: context,
        title: 'Connection timed out',
        message: 'Ocorreu um erro inesperado na comunicação com o servidor. Por'
            ' favor, reinicie o aplicativo e certifique-se de executar no '
            'terminal (estando no diretório do JSON server) o comando de '
            'iniciar o JSON server (json-server --watch salgadar.json).',
        buttonConfirmationLabel: 'ok');
  }
}
