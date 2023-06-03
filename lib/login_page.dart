import 'package:flutter/material.dart';
import 'package:google_login/google_sign_in.dart';
import 'package:google_login/login.dart';

import 'package:provider/provider.dart';

class LoGINPage extends StatelessWidget {
  const LoGINPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final provider = Provider.of<GoogleSignIN>(context, listen: false);
            provider.googleLogin();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
            );
          },
          child: const Text('LOGIN'),
        ),
      ),
    );
  }

  // Future<String?> signINWithGoogle() async {
  //   GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  //   AuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //   UserCredential userCredential =
  //       await FirebaseAuth.instance.signInWithCredential(credential);

  //   print(userCredential.user?.displayName);
  //   return userCredential.user?.displayName;
  // }
}
