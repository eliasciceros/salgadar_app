import 'package:builders/builders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:salgadar_app/app/app_widget.dart';
import 'package:salgadar_app/app/shared/utils/local_notification/local_notification_utils.dart';

import 'app/app_module.dart';

void main() async {
  await Stetho.initialize();
  await LocalNotificationUtils.initializeSettings();
  Builders.systemInjector(Modular.get); // configuring the System Injector
  runApp(
    ModularApp(
      module: AppModule(),
      child: AppWidget(),
    ),
  );
}
