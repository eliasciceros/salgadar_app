import 'package:builders/builders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/user_settings_controller.dart';
import 'shared/themes/app_themes.dart';

/// Widget principal do app.
class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserSettingsController>(builder: (context, value) {
      return MaterialApp(
        title: "Salgadar App",
        theme: ThemeCollection.getAppTheme(),
        darkTheme: ThemeCollection.darkTheme(),
        debugShowCheckedModeBanner: false,
      ).modular();
    });
  }
}
