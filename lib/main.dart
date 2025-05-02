import 'package:dailywage_tracker/app/notifiers/app_notifier.dart';
import 'package:dailywage_tracker/app/providers/work_log_provider.dart';
import 'package:dailywage_tracker/app/providers/work_site_provider.dart';
import 'package:dailywage_tracker/app/services/isar_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:than_pkg/than_pkg.dart';
import './app/general_server/index.dart';

import 'app/my_app.dart';
import 'app/services/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThanPkg.windowManagerensureInitialized();

  //init config
  await initAppConfigService();

  await GeneralServices.instance.init(packageName: 'dailywage_tracker');

  await IsarServices.init(appConfigNotifier.value.getDBDir);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WorkSiteProvider()),
        ChangeNotifierProvider(create: (context) => WorkLogProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
