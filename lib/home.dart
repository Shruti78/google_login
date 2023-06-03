import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_login/login.dart';
import 'package:google_login/login_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return Login();
          } 
          else if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong'),
            );
          } else {
            return LoGINPage();
          }
        },
        stream: FirebaseAuth.instance.authStateChanges(),
      ),
    );
  }
}
