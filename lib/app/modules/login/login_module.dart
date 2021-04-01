import 'package:flutter_modular/flutter_modular.dart';
import 'package:salgadar_app/app/modules/login/pages/sign_up_page.dart';

import 'controllers/sign_up_page_controller.dart';
import 'login_controller.dart';
import 'login_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => LoginController()),
    Bind.singleton((i) => SignUpPageController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => LoginPage(),
    ),
    ChildRoute(
      SignUpPage.routeName,
      child: (_, args) => SignUpPage(user: args.data.user),
      transition: TransitionType.leftToRightWithFade,
    ),
  ];

  static const routeName = '/login';
}
