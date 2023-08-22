import 'package:flutter/material.dart';
import 'package:flash_chat/screens/chat_screen.dart';

const mainPurple = Color(0xff6750A4);
const subPurple = Color(0xffE8DEF8);
var borderPurpleforEmail = Color(0xffE8DEF8);
var borderPurpleforPassword = Color(0xffE8DEF8);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Specify value here',
  hintStyle: TextStyle(color: Color.fromARGB(255, 176, 190, 197)),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffE8DEF8), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffE8DEF8), width: 2.5),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

class userBubble extends StatelessWidget {
  userBubble(
      {required this.userName, required this.userEmail, required this.userID});

  late String userName;
  late String userEmail;
  late String userID;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.0),
      child: Material(
        // elevation: 1.0,
        color: Color(0xffe8ddff).withOpacity(0.15),
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => chatScreen(
                  userName: userName,
                  userEmail: userEmail,
                  userID: userID,
                ),
              ),
            );
          },
          child: Row(
            children: [
              Image.asset(
                'assets/logo_circular.png',
                height: 70,
                width: 100,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  '$userName',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff88758c),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class messageBubble extends StatelessWidget {
  messageBubble({required this.messageData});

  final String messageData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Material(
            elevation: 5.0,
            color: mainPurple,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                messageData,
                style: TextStyle(
                  fontSize: 15,
                  // fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
