import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_serasi_raya/application/config/app_theme.dart';
import 'package:test_serasi_raya/application/routes/app_pages.dart';
import 'package:test_serasi_raya/application/utils/get_di.dart';
import 'package:test_serasi_raya/data/local/providers/base_provider.dart';
import 'package:test_serasi_raya/presentation/views/auth/login/binding/login_binding.dart';

Future<void> main() async {
  Dependency.init();
  WidgetsFlutterBinding.ensureInitialized();

  await BaseProvider().onInitDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme().lightTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: LoginBinding(),
      initialRoute: Routes.splash,
      getPages: AppPages.routes,
    );
  }
}
