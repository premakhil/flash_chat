import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  late String messageText;
  late User loggedinUser;
  final _firestore = FirebaseFirestore.instance;

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
          mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Text(widget.userName),
            // Text(widget.userEmail),
            // Text(widget.userID),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(3, 0, 0, 6),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            messageText = value;
                          },
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Message'),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: mainPurple,
                          ),
                          child: Icon(Icons.send),
                          onPressed: () {
                            // _firestore.collection('messages').add({
                            //   'text': messageText,
                            //   'sender': loggedinUser.email,
                            //   'userId': loggedinUser.uid
                            // });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
