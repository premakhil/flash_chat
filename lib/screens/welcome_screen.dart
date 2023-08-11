import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo.png',
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
            child: SizedBox(
              width: 220.0,
              height: 60.0,
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff6750A4)),
                    // shape: StadiumBorder(),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    // primary: Color(0xff6750A4),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}


// E8DEF8
// 6750A4

// 5063A4


// D9D3E8