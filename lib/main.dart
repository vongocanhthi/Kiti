import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kiti/src/language/LocalizationService.dart';
import 'package:kiti/ui/view/SplashPage.dart';
import 'package:kiti/ui/viewmodel/HomeViewModel.dart';
import 'package:kiti/utils/Constants.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: Constants.APP_NAME,
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // HomeViewModel viewModel = Provider.of(context); // context.watch()
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kiti',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        locale: LocalizationService.locale,
        fallbackLocale: LocalizationService.fallbackLocale,
        translations: LocalizationService(),
        // initialRoute: AppRoute.routeHomeScreen(),
        // initialBinding: AppBinding(),
        // getPages: AppRoute.generateGetPages(),
        home: const SplashPage(),
      ),
    );
  }
}
