import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';

class chatScreen extends StatefulWidget {
  chatScreen(
      {required this.userName, required this.userEmail, required this.userID});

  late String userName;
  late String userEmail;
  late String userID;

  @override
  State<chatScreen> createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainPurple,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/logo_circular.png',
              height: 45,
              width: 80,
            ),
            Text(widget.userName)
          ],
        ),
        centerTitle: false,
        leadingWidth: 20,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(widget.userName),
                // Text(widget.userEmail),
                // Text(widget.userID),
              ],
            )
          ],
        ),
      ),
    );
  }
}
