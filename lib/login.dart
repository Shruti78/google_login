import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? dateOfBirth;
  @override
  void initState() {
    super.initState();

    final user = FirebaseAuth.instance.currentUser!;

    // Retrieve the user's ID token result asynchronously
    user.getIdTokenResult().then((idTokenResult) {
      // Access the custom claims from the ID token
      dateOfBirth = idTokenResult.claims?['dateOfBirth'];
      setState(() {}); // Update the UI with the date of birth
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

// Access the dateOfBirth custom claim from the ID token

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("PROFILE"),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              user.displayName!,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            Text(
              user.email!.split("@")[0],
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            if (dateOfBirth != null) // Display the date of birth if available
              Text(
                'Date of Birth: $dateOfBirth',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
          ],
        ),
      ),
    );
  }
}
