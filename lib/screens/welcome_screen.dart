import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetoHome();
  }

  _navigatetoHome() async {
    await Future.delayed(Duration(milliseconds: 1000), () {});
    Navigator.pushReplacementNamed(context, '/login');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Material(
              borderRadius: BorderRadius.circular(50),
              elevation: 10.0,
              child: Hero(
                tag: 'logo',
                child: Image.asset(
                  'assets/logo_circular.png',
                  height: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
