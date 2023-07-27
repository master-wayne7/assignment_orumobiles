import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  static const route = '/notification-screen';

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    RemoteMessage? message = ModalRoute.of(context)!.settings.arguments == null
        ? null
        : ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 44, 46, 67),
        title: const Text("Notifications"),
      ),
      body: Center(
        child: message == null
            ? Text("No notifications")
            : Column(
                children: [
                  Text("${message!.notification!.title}"),
                  Text("${message.notification!.body}"),
                ],
              ),
      ),
    );
  }
}
