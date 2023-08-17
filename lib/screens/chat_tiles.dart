import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class chatTiles extends StatefulWidget {
  const chatTiles({Key? key}) : super(key: key);

  @override
  State<chatTiles> createState() => _chatTilesState();
}

class _chatTilesState extends State<chatTiles> {
  final _auth = FirebaseAuth.instance;
  late User loggedinUser;

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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  style:
                      TextStyle(color: mainPurple, fontWeight: FontWeight.w800),
                ),
                actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.white),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.grey[600]),
                        ),
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          Navigator.popUntil(
                              context, ModalRoute.withName('/login'));
                          _auth.signOut();
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
                          overlayColor: MaterialStateProperty.all(Colors.white),
                          foregroundColor:
                              MaterialStateProperty.all(mainPurple),
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
      ),
      body: Center(
        child: Text('Tiles'),
      ),
    );
  }
}
