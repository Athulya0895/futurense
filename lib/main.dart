import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:futurensemobileapp/firebase_options.dart';
import 'package:futurensemobileapp/screens/splas_screen/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laravel_echo/laravel_echo.dart';
import 'package:provider/provider.dart';
import 'utils/locator.dart';
import 'utils/share_prefs.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  // print("Handling a background message: ${message.messageId}");
}

void main() async {
  // const String BEARER_TOKEN = 'YOUR_BEARER_TOKEN_HERE';

// // Create socket.io client
//   IO.Socket socket = IO.io(
//     'http://13.127.192.123',
//     IO.OptionBuilder()
//         .disableAutoConnect()
//         .setTransports(['websocket']).build(),
//   );

// // Create echo instance
//   Echo echo = new Echo(
//     broadcaster: EchoBroadcasterType.SocketIO,
//     client: socket,
//   );

// // Listening public channel
//   echo.channel('messages').listen('MessageCreated', (e) {
//     print(e);
//   });

// // Listening private channel
// // Needs auth. See details how to authorize channel below in guides
//   echo.private('messages').listen('MessageCreated', (e) {
//     print(e);
//   });

// // Listening presence channel
// // Needs auth. See details how to authorize channel below in guides
//   echo.join('presence-channel').here((users) {
//     print(users);
//   }).joining((user) {
//     print(user);
//   }).leaving((user) {
//     print(user);
//   }).listen('PresenceEvent', (e) {
//     print(e);
//   });

// Accessing socket instance
  // echo.connector.socket.onConnect((_) => print('connected'));
  // echo.connector.socket.onDisconnect((_) => print('disconnected'));
  //socket Nodejs
  String url = 'http://13.127.192.123';
  String url1 = 'http://192.168.69.106:6001';
  String url2 = 'http://192.168.70.102:6001';
  IO.Socket socket = IO.io(
      url2,
      IO.OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
          .setExtraHeaders({'foo': 'bar'}) // optional
          .build());
  socket.onConnect((_) {
    print('connect');
    socket.emit('msg', 'test');
  });
  //socket on userId
  socket.on('', (data) {});
  socket.onDisconnect((_) => print('disconnect'));
  socket.onerror((e) => print(e));
  // socket.on('fromServer', () => print());
  //socket nodejs

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // print("token phone");
  print(await FirebaseMessaging.instance.getToken());

  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  setupLocator();
  await locator<SharedPrefs>().init();
  locator<SharedPrefs>().firsttimeLogin = false;
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext get context => navigatorKey.currentContext!;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'futurense Mobile App',
      navigatorKey: navigatorKey,
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xff6EBFC3),
            ),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      // theme: ThemeData(primarySwatch: Colors.yellow),
      home: const SplashScreen(),
    );
  }
}
