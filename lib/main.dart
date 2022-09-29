import 'package:flutter/material.dart';
import 'package:futurensemobileapp/screens/auth/login/login.dart';
import 'package:provider/provider.dart';

import 'utils/locator.dart';
import 'utils/share_prefs.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await locator<SharedPrefs>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'futurense Mobile App',
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xffFDBA2F),
            ),
      ),
      // theme: ThemeData(primarySwatch: Colors.yellow),
      home: const Login(),
    );
  }
}
