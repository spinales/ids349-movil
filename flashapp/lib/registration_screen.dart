import 'package:flashapp/rounded_button.dart';
import 'package:flashapp/styles.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  static const String id = 'registration_screen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _auth = FirebaseAuth.instance;
  var email;
  var password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'logo',
              child: Container(
                height: 200,
                child: Image.asset('images/thunder.jpg'),
              ),
            ),

            const SizedBox(
              height: 48.0,
            ),

            // todo: cambiarle el color de texto del input, que no sea blanco
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              style: const TextStyle(
                color: Colors.black87,
              ),
              decoration: kInputStyle.copyWith(hintText: 'Enter your email'),
            ),

            const SizedBox(
              height: 20.0,
            ),

            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              style: const TextStyle(
                color: Colors.black87,
              ),
              decoration: kInputStyle.copyWith(
                hintText: 'Enter your password'
              ),
            ),


            RoundedButton(
              color: Colors.blueAccent,
              text: 'Register',
              action: () async {
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if (newUser != null) {
                    Navigator.pushNamed(context, '');
                  }

                } catch (e) {
                  print(e);
                  // TODO
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}
