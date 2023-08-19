import 'dart:io';
import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class chatTiles extends StatefulWidget {
  const chatTiles({Key? key}) : super(key: key);

  @override
  State<chatTiles> createState() => _chatTilesState();
}

class _chatTilesState extends State<chatTiles> {
  final _auth = FirebaseAuth.instance;
  late User loggedinUser;
  late String messageText;
  final _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;

      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  void messageStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: mainPurple),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  backgroundColor: Colors.white,
                  content: Text(
                    "Log Out?",
                    style: TextStyle(
                        color: mainPurple, fontWeight: FontWeight.w800),
                  ),
                  actions: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.white),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.grey[600]),
                          ),
                          onPressed: () {
                            Navigator.of(ctx).pop();
                            _auth.signOut();
                            Navigator.popUntil(
                                context, ModalRoute.withName('/login'));
                          },
                          child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.all(14),
                            child: const Text(
                              "Yes",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.white),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.grey[600]),
                          ),
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.all(14),
                            child: const Text(
                              "No",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
          title: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(width: 2, color: subPurple)),
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/logo_circular.png',
                height: 50,
                width: 80,
              ),
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          ElevatedButton(
              onPressed: () {
                messageStream();
              },
              child: Text('click')),
          Padding(
            padding: const EdgeInsets.fromLTRB(3, 0, 0, 6),
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
                    decoration:
                        kTextFieldDecoration.copyWith(hintText: 'Message'),
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
                      _firestore.collection('messages').add(
                          {'text': messageText, 'sender': loggedinUser.email});
                    },
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
