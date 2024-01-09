import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/routes/myrouters.dart';
import 'package:flutter_application_1/view/Cubit/PizzaItemCubit.dart';
import 'package:flutter_application_1/view/main_screen/Cubit/CursorCubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
         BlocProvider(create: (context) => CarouseCubit(),),
         BlocProvider(create: (context) => PizzaItemCubit(),),
       
          
        ],
        child: MaterialApp(
          title: "Pizza App",
          theme: ThemeData(
           scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.white,
          
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: MyRoutes.generatedRoutes,
          initialRoute: '/splash',
        ));
  }
}
