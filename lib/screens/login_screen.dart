import 'package:flash_chat/main.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: null,
        iconTheme: IconThemeData(
          color: Color(0xff6750A4),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 150.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(width: 2, color: subPurple)),
                      child: Hero(
                        tag: 'logo',
                        child: Image.asset(
                          'assets/logo_circular.png',
                          height: 50,
                          width: 100,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    flex: 3,
                    child: DefaultTextStyle(
                      style: TextStyle(
                          fontSize: 40.0,
                          color: mainPurple,
                          fontWeight: FontWeight.w900),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText('Flash Chat',
                              speed: const Duration(milliseconds: 150))
                        ],
                        repeatForever: true,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50.0),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    borderPurpleforEmail = subPurple;
                  });
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'E-mail',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: borderPurpleforEmail, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              TextField(
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      borderPurpleforPassword = subPurple;
                    });
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Password',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: borderPurpleforPassword, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  )),
              SizedBox(height: 24.0),
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
                    child: !showSpinner
                        ? Text(
                            'Log in',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          )
                        : SpinKitDualRing(
                            color: Colors.white,
                            size: 25.0,
                            lineWidth: 3.0,
                          ),
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.pushNamed(context, '/chatTiles');
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        setState(() {
                          showSpinner = false;
                          borderPurpleforEmail = Colors.red;
                          borderPurpleforPassword = Colors.red;
                        });

                        print(e);
                      }
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
                  Text("Don't have an account?"),
                  SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      'Sign Up',
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
