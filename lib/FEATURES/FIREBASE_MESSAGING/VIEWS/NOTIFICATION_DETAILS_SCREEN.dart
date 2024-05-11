import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NOTIFICATIONS_SCREEN extends StatelessWidget {
  final RemoteMessage message;
  const NOTIFICATIONS_SCREEN({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Column(
        children: [
          Text(message.notification!.title!),
          Text(message.notification!.body!)
        ],
      ))),
    );
  }
}
