import 'package:flutter/material.dart';
import 'package:messagerie_app/helper/authenticate.dart';
// import 'package:messagerie_app/views/signin.dart';
// import 'package:messagerie_app/views/signin.dart';
// import 'package:messagerie_app/views/signup.dart';
import 'package:firebase_core/firebase_core.dart';

// import 'package:firebase_core/firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff1f1f1f),
        primarySwatch: Colors.blue,
      ),
      home: const Authenticate(),
    );
  }
}
