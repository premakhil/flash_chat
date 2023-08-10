import 'package:flutter/material.dart';

// class loginScreen extends StatefulWidget {
//   const loginScreen({Key? key}) : super(key: key);

//   @override
//   State<loginScreen> createState() => _loginScreenState();
// }

// class _loginScreenState extends State<loginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//     )
//   }
// }
class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        iconTheme: IconThemeData(
          color: Color(0xff6750A4),
        ),
      ),
      body: Center(
        child: TextField(
          onChanged: (value) {
            //Do something with the user input.
          },
          decoration: InputDecoration(
            hintText: 'Enter your email',
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
          ),
        ),
      ),
    );
  }
}
