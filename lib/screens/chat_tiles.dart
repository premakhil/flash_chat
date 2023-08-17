import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class chatTiles extends StatefulWidget {
  const chatTiles({Key? key}) : super(key: key);

  @override
  State<chatTiles> createState() => _chatTilesState();
}

class _chatTilesState extends State<chatTiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Tiles'),
      ),
    );
  }
}
