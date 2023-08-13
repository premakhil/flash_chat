import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class registerScreen extends StatefulWidget {
  const registerScreen({Key? key}) : super(key: key);

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            // Navigator.pushNamed(context, '/');
            // Navigator.pop(context);
            // Navigator.pop(context);

            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        iconTheme: IconThemeData(
          color: Color(0xff6750A4),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: subPurple)),
                    child: Hero(
                      tag: 'logo',
                      child: Image.asset(
                        'assets/logo.png',
                        height: 50,
                        width: 100,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 40.0,
                        // fontFamily: 'RobotoMono',
                        color: mainPurple,
                        fontWeight: FontWeight.w900),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('Flash Chat',
                            speed: const Duration(milliseconds: 150))
                      ],
                      repeatForever: false,
                      totalRepeatCount: 5,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50.0),
              TextField(
                  onChanged: (value) {},
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'Username')),
              SizedBox(height: 25.0),
              TextField(
                  onChanged: (value) {},
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'E-mail')),
              SizedBox(height: 25.0),
              TextField(
                  onChanged: (value) {},
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'Password')),
              SizedBox(height: 25.0),
              TextField(
                  onChanged: (value) {},
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Confirm Password')),
              SizedBox(height: 45.0),
              SizedBox(
                width: 130.0,
                height: 55.0,
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: mainPurple,
                    ),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    onPressed: () {
                      // Navigator.pushNamed(context, '/login');
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Have an account aleady?"),
                  SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: mainPurple,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
