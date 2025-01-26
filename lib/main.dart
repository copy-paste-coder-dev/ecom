import 'package:ecommerce_app_with_clean_architecture/core/environment_variables.dart';
import 'package:ecommerce_app_with_clean_architecture/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();

  await EnvironmentVariables.instance.init(envType: EnvType.production);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: EnvironmentVariables.instance.debugMode,
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
