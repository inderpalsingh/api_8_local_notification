import 'package:api_8_local_notification/notification_manager.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  NotificationManager? notificationManager;

  @override
  void initState() {
    super.initState();
    notificationManager = NotificationManager();
    notificationManager!.initializeNotificationManager();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Notification'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Notify'),
              onPressed: () {
                notificationManager!.normalNotify(id: 100, title: 'title', body: 'body');
              },
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              child: const Text('scheduled'),
              onPressed: () {
                notificationManager!.scheduledNotify(id: 100, title: 'title', body: 'body');
              },
            ),
          ],
        ),
      ),
    );
  }
}
