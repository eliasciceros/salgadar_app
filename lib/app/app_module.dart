import 'package:flutter_modular/flutter_modular.dart';
import 'package:salgadar_app/app/controllers/user_settings_controller.dart';
import 'package:salgadar_app/app/data/api/cart_api_dao.dart';
import 'package:salgadar_app/app/data/api/item_api_dao.dart';
import 'package:salgadar_app/app/data/api/purchase_api_dao.dart';
import 'package:salgadar_app/app/data/local/cart_SQLite_dao.dart';
import 'package:salgadar_app/app/data/local/item_SQLite_dao.dart';
import 'package:salgadar_app/app/data/local/item_cart_SQLite_dao.dart';
import 'package:salgadar_app/app/data/local/purchase_SQLite_dao.dart';
import 'package:salgadar_app/app/modules/settings/settings_module.dart';
import 'package:salgadar_app/app/modules/splash_screen/splash_screen_module.dart';

import 'app_controller.dart';
import 'controllers/cart_controller.dart';
import 'controllers/item_controller.dart';
import 'controllers/purchase_controller.dart';
import 'controllers/user_controller.dart';
import 'data/api/user_api_dao.dart';
import 'data/local/user_SQLite_dao.dart';
import 'modules/home/home_module.dart';
import 'modules/login/controllers/sign_up_page_controller.dart';
import 'modules/login/login_module.dart';
import 'modules/user_purchase/user_purchase_module.dart';

class AppModule extends Module {
  /// Lista de injecoes de dependencia do projeto.
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => AppController()),
    Bind.singleton((i) => UserSettingsController()),
    Bind.singleton((i) => UserController()),
    Bind.singleton((i) => ItemController()),
    Bind.singleton((i) => CartController()),
    Bind.singleton((i) => PurchaseController()),
    Bind.singleton((i) => SignUpPageController()),
    Bind.singleton((i) => UserAPIDao()),
    Bind.singleton((i) => ItemAPIDao()),
    Bind.singleton((i) => CartAPIDao()),
    Bind.singleton((i) => ItemCartSQLiteDao()),
    Bind.singleton((i) => PurchaseSQLiteDao()),
    Bind.singleton((i) => UserSQLiteDao()),
    Bind.singleton((i) => ItemSQLiteDao()),
    Bind.singleton((i) => CartSQLiteDao()),
    Bind.singleton((i) => PurchaseAPIDao()),
  ];

  @override

  /// Modulos associados a este aplicativo.
  final List<ModularRoute> routes = [
    ModuleRoute(SplashScreenModule.routeName, module: SplashScreenModule()),
    ModuleRoute(LoginModule.routeName, module: LoginModule()),
    ModuleRoute(SettingsModule.routeName, module: SettingsModule()),
    ModuleRoute(HomeModule.routeName, module: HomeModule()),
    ModuleRoute(UserPurchaseModule.routeName, module: UserPurchaseModule()),
  ];
}
