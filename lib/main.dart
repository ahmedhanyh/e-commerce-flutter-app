import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:final_flutter_project/firebase_options.dart';
// Screen widgets imports that will be deleted in the final version
import 'package:final_flutter_project/features/splash_screen/view.dart';
import 'package:final_flutter_project/features/login/view.dart';
import 'package:final_flutter_project/features/register/view.dart';
import 'package:final_flutter_project/features/profile/view.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Final Flutter Project',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const ProfileScreen(),
    );
  }
}
