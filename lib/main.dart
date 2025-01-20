import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zego/firebase_options.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZEGOCLOUD Call Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Replace with your ZEGOCLOUD credentials
  final int appID = 882605336;
  // Your ZEGOCLOUD App ID
  final String appSign =
      '6392647d5907e0a7486059407a2a7f4fe9bdb25d6efc48729794bcc788929759';
  @override
  initState() {
    super.initState();
    ZegoUIKitPrebuiltCallInvitationService().init(
      notificationConfig: ZegoCallInvitationNotificationConfig(
        androidNotificationConfig: ZegoCallAndroidNotificationConfig(
          showFullScreen: true,
        ),
      ),
      appID: appID,
      appSign: appSign,
      userID: 'ahmed',
      userName: 'ahmed',
      plugins: [],
    );
  }

  // Your ZEGOCLOUD App Sign
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ZEGOCLOUD Call Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ZegoCallPage(
                      appID: appID,
                      appSign: appSign,
                      userID: 'ahmed',
                      callID: '12345',
                    ),
                  ),
                );
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
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall());
  }
}
