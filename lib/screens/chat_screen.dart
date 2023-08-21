import 'package:flutter/material.dart';

class chatScreen extends StatefulWidget {
  chatScreen({required this.userName});

  late String userName;

  @override
  State<chatScreen> createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [Text(widget.userName)],
        ),
      ),
    );
  }
}
