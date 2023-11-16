import 'package:flashapp/login_screen.dart';
import 'package:flashapp/registration_screen.dart';
import 'package:flashapp/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static const String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    );

    animation = CurvedAnimation(
      parent: controller,
        curve: Curves.easeInOutCubicEmphasized
    );

    controller.forward();
    controller.addListener(() {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Hero(
                  tag: 'logo',
                  child: Image.asset('images/thunder.jpg', width: controller.value * 100,),
                ),

                DefaultTextStyle(
                  style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900
                  ),
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    pause: const Duration(milliseconds: 1000),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                    animatedTexts: [
                      TypewriterAnimatedText('Flash Chat',
                        speed: const Duration(milliseconds: 300),
                      )
                    ],
                  ),
                ),

              ],
            ),

            const SizedBox(height: 48.0,),

            RoundedButton(color: Colors.lightBlueAccent, text: 'Log In', action: (){
              Navigator.of(context).pushNamed(LogInScreen.id);
            }),
            RoundedButton(color: Colors.blueAccent, text: 'Register', action: (){
              Navigator.of(context).pushNamed(RegistrationScreen.id);
            }),

          ],
        ),
      ),
    );
  }
}
