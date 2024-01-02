import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Theme/style.dart';
import 'package:flutter_application_1/routes/myrouters.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pizza App",
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyRoutes.generatedRoutes,
      initialRoute: '/splash',
    );
  }
}