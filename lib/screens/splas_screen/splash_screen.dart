import 'package:after_layout/after_layout.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:futurensemobileapp/screens/auth/login/login.dart';
import 'package:futurensemobileapp/screens/mentee/home/home/home.dart';
import 'package:futurensemobileapp/screens/mentee/home/homepage_mentee.dart';
import 'package:futurensemobileapp/screens/mentor/home/home/home.dart';
import 'package:futurensemobileapp/screens/mentor/home/homepage_mentor.dart';
import 'package:futurensemobileapp/screens/mentor/setPreference/setpreference.dart';
import 'package:futurensemobileapp/utils/locator.dart';
import 'package:futurensemobileapp/utils/share_prefs.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

// import 'package:futurensemobileapp/screens/auth/login/login.dart';
// import 'package:futurensemobileapp/screens/mentee/setPreference/setPreference.dart';

// import 'package:futurensemobileapp/base/base_view_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     // setupLocator();
//     // locator<SharedPrefs>().init();
//     goto();
//     super.initState();
//   }

//   void goto() async {
//     print(locator<SharedPrefs>().role == true);
//     Future.delayed(const Duration(seconds: 3)).then(
//       (_) {
//         locator<SharedPrefs>().isLogin
//             ? locator<SharedPrefs>().role == true
//                 ? Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => const Home(),
//                     ),
//                   )
//                 : Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => const HomeMentee(),
//                     ),
//                   )
//             : Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(builder: (context) => const Login()),
//                 (route) => false);
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // backgroundColor: Colors.white,
//         body: Center(
//       child: Lottie.asset(
//         'assets/splashscreen.json',
//         repeat: true,
//         // width: 300,
//         // height: 300,
//         fit: BoxFit.cover,
//       ),
//     )
//         //     body: SizedBox(
//         //   height: double.infinity,
//         //   width: double.infinity,
//         //   child: Image.asset("assets/splashscreen.gif",
//         //       gaplessPlayback: true, fit: BoxFit.cover),

//         );
//     // ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: (3)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: Lottie.asset(
          'assets/splashscreen.json',
          fit: BoxFit.cover,
          controller: _controller,
          height: double.infinity,
          width: double.infinity,
          animate: true,
          repeat: true,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward().whenComplete(() => locator<SharedPrefs>().isLogin
                  ? locator<SharedPrefs>().role == true
                      ? Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Home(),
                          ),
                        )
                      : Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const HomeMentee(),
                          ),
                        )
                  : Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                      (route) => false));
          },
        ),
      ),
    );
  }

  
}


