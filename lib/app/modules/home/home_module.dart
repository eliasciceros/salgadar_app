import 'package:flutter_modular/flutter_modular.dart';
import 'package:salgadar_app/app/modules/home/pages/cart_page.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => HomeController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => HomePage(),
    ),
    ChildRoute(
      CartPage.routeName,
      child: (_, args) => CartPage(),
    ),
  ];

  static const routeName = '/home';
}
