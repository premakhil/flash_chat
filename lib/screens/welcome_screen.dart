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
    await Future.delayed(Duration(milliseconds: 1500), () {});
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
            Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/logo_circular.png',
                height: 100,
              ),
            ),
            // Padding(
            // padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
            // child: SizedBox(
            //   width: 220.0,
            //   height: 60.0,
            //   child: Material(
            //     elevation: 5.0,
            //     borderRadius: BorderRadius.circular(20.0),
            //     child: ElevatedButton(
            //       style: ButtonStyle(
            //         backgroundColor: MaterialStateProperty.all(mainPurple),
            //         // shape: StadiumBorder(),
            //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //             RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(20.0))),
            //         // primary: Color(0xff6750A4),
            //       ),
            //       child: Text(
            //         'Next',
            //         style: TextStyle(
            //           fontSize: 17.0,
            //         ),
            //       ),
            //       onPressed: () {
            //         Navigator.pushNamed(context, '/login');
            //       },
            //     ),
            //   ),
            // ),
            // )
          ],
        ),
      ),
    );
  }
}
