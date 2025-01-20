import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZEGOCLOUD Call Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // Replace with your ZEGOCLOUD credentials
  final int appID = 882605336; // Your ZEGOCLOUD App ID
  final String appSign = '6392647d5907e0a7486059407a2a7f4fe9bdb25d6efc48729794bcc788929759';

  const HomePage({super.key}); // Your ZEGOCLOUD App Sign

  @override
  Widget build(BuildContext context) {
    TextEditingController userIDController = TextEditingController();
    TextEditingController callIDController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('ZEGOCLOUD Call Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: userIDController,
              decoration: InputDecoration(
                labelText: 'Enter Your User ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: callIDController,
              decoration: InputDecoration(
                labelText: 'Enter Call ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final userID = userIDController.text.trim();
                final callID = callIDController.text.trim();

                if (userID.isNotEmpty && callID.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ZegoCallPage(
                        appID: appID,
                        appSign: appSign,
                        userID: userID,
                        callID: callID,
                      ),
                    ),
                  );
                }
              },
              child: Text('Start Call'),
            ),
          ],
        ),
      ),
    );
  }
}

class ZegoCallPage extends StatelessWidget {
  final int appID;
  final String appSign;
  final String userID;
  final String callID;

  const ZegoCallPage({
    super.key,
    required this.appID,
    required this.appSign,
    required this.userID,
    required this.callID,
  });

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: appID,
      appSign: appSign,
      userID: userID,
      userName: 'User $userID',
      callID: callID,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
