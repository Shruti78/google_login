import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_login/google_sign_in.dart';
import 'package:google_login/login.dart';
import 'package:google_login/login_page.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => GoogleSignIN(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const LoGINPage(),
      ),
    );
  }
}
