import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class registerScreen extends StatefulWidget {
  const registerScreen({Key? key}) : super(key: key);

  // static late String name;

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  final _auth = FirebaseAuth.instance;
  late final String email;
  late final String password;

  bool showSpinner = false;
  late final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: null,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: Color(0xff6750A4),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50),
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
                          // fontFamily: 'RobotoMono',
                          color: mainPurple,
                          fontWeight: FontWeight.w900),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText('Flash Chat',
                              speed: const Duration(milliseconds: 150))
                        ],
                        repeatForever: true,
                        // totalRepeatCount: 5,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50.0),
              TextField(
                  onChanged: (value) {
                    name = value;
                  },
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'Username')),
              SizedBox(height: 25.0),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                    setState(() {
                      borderPurpleforEmail = subPurple;
                    });
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'E-mail',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: borderPurpleforEmail, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  )),
              SizedBox(height: 25.0),
              TextField(
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                    setState(() {
                      borderPurpleforPassword = subPurple;
                    });
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Password',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: borderPurpleforPassword, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  )),
              SizedBox(height: 25.0),
              TextField(
                  obscureText: true,
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
                    child: !showSpinner
                        ? Text(
                            'Register',
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
                        final user = await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.pushNamed(context, '/chatTiles');
                        }

                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        print(e);
                        setState(() {
                          showSpinner = false;
                          borderPurpleforEmail = Colors.red;
                          borderPurpleforPassword = Colors.red;
                        });
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
                  Text("Have an account aleady?"),
                  SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.popUntil(
                          context, ModalRoute.withName('/login'));
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
