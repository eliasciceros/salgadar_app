import 'package:flutter_modular/flutter_modular.dart';
import 'package:salgadar_app/app/modules/login/controllers/sign_up_page_controller.dart';
import 'package:salgadar_app/app/modules/login/pages/sign_up_page.dart';

import 'settings_controller.dart';
import 'settings_page.dart';

class SettingsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => SettingsController()),
    Bind.singleton((i) => SignUpPageController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => SettingsPage(),
    ),
    ChildRoute(
      SignUpPage.routeName,
      child: (_, args) => SignUpPage(user: args.data.user),
      transition: TransitionType.leftToRightWithFade,
    ),
  ];

  static const routeName = '/settings';
}
