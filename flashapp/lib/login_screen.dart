import 'package:flashapp/rounded_button.dart';
import 'package:flashapp/styles.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  static const String id = 'login_screen';

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {



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
              style: const TextStyle(
                color: Colors.black87,
              ),
              decoration: kInputStyle.copyWith(hintText: 'Enter your email'),
            ),

            const SizedBox(
              height: 20.0,
            ),

            TextField(
              style: const TextStyle(
                color: Colors.black87,
              ),
              decoration: kInputStyle.copyWith(
                  hintText: 'Enter your password'
              ),
            ),


            RoundedButton(
              color: Colors.lightBlueAccent,
              text: 'Login',
              action: (){
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
            })
          ],
        ),
      ),
    );
  }
}
