import 'package:flutter_modular/flutter_modular.dart';

import 'pages/detailed_purchase_page.dart';
import 'user_purchase_controller.dart';
import 'user_purchase_page.dart';

class UserPurchaseModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => UserPurchaseController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => UserPurchasePage(),
      transition: TransitionType.leftToRightWithFade,
    ),
    ChildRoute(
      DetailedPurchasePage.routeName,
      child: (_, args) => DetailedPurchasePage(
        purchase: args.data.purchase,
        key: args.data.key,
      ),
      transition: TransitionType.leftToRightWithFade,
    ),
  ];

  static const routeName = '/purchase';
}
