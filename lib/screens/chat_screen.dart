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
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  final messagetextController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
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
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('messages').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: mainPurple,
                      color: mainPurple,
                    ),
                  );
                }

                final messages = snapshot.data!.docs;
                List<messageBubble> messageWidgets = [];

                for (var message in messages) {
                  final messageData = message.data() as Map<String, dynamic>;
                  if (messageData['senderID'] == loggedinUser.uid &&
                      messageData['receiverID'] == widget.userID) {
                    final textMessageData = messageData['text'];

                    final messageWidget = messageBubble(
                      messageData: textMessageData,
                    );
                    messageWidgets.add(messageWidget);
                  } else if (messageData['senderID'] == widget.userID &&
                      messageData['receiverID'] == loggedinUser.uid) {
                    final textMessageData = messageData['text'];

                    final messageWidget = messageBubble(
                      messageData: textMessageData,
                    );
                    messageWidgets.add(messageWidget);
                  }
                }

                return Expanded(
                  child: ListView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                    children: messageWidgets,
                  ),
                );
              },
            ),
            Padding(
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
                        controller: messagetextController,
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
                        onPressed: () async {
                          try {
                            messagetextController.clear();
                            await _firestore.collection('messages').add({
                              'text': messageText,
                              'sender': loggedinUser.displayName,
                              'senderMail': loggedinUser.email,
                              'senderID': loggedinUser.uid,
                              'receiver': widget.userName,
                              'receiverMail': widget.userEmail,
                              'receiverID': widget.userID
                            });
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
