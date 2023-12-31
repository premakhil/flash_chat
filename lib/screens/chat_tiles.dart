import 'dart:io';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/registration_screen.dart';
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

        _firestore.collection('users').doc(loggedinUser.uid).set({
          'email': loggedinUser.email,
          'userID': loggedinUser.uid,
          'name': loggedinUser.displayName
          // 'name': 'tempName'
        });
      }
    } catch (e) {
      print(e);
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
          // title: Container(
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(40),
          //       border: Border.all(width: 2, color: subPurple)),
          //   child: Hero(
          //     tag: 'logo',
          //     child: Image.asset(
          //       'assets/logo_circular.png',
          //       height: 50,
          //       width: 80,
          //     ),
          //   ),
          // ),
          // centerTitle: true,
        ),
      ),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Text('People',
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: mainPurple)),
          ),
          SizedBox(
            height: 10,
          ),
          StreamBuilder<QuerySnapshot>(
            stream: _firestore.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: mainPurple,
                    color: mainPurple,
                  ),
                );
              }

              final users = snapshot.data!.docs;
              List<userBubble> userWidgets = [];

              for (var user in users) {
                final userData = user.data() as Map<String, dynamic>;
                if (userData['userID'] != loggedinUser.uid) {
                  final userEmail = userData['email'];
                  final userName = userData['name'];
                  final userID = userData['userID'];

                  final userWidget = userBubble(
                      userName: userName, userEmail: userEmail, userID: userID);
                  userWidgets.add(userWidget);
                }
              }

              return Expanded(
                child: ListView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  children: userWidgets,
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
