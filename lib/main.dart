import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:futurensemobileapp/firebase_options.dart';
import 'package:futurensemobileapp/screens/splas_screen/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
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
  // @override
  // void initState() {
  //   print("entering----");
  //   FirebaseMessaging.instance.getToken().then((newToken) {
  //     print("FCM token:");
  //     print(newToken);

  //     //save device token to server
  //   });
  // }
  
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
