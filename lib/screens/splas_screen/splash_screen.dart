import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import 'package:futurensemobileapp/screens/auth/login/login.dart';
import 'package:futurensemobileapp/screens/mentee/setPreference/setPreference.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         backgroundColor: Colors.white,
//         body: Container(
//             height: double.infinity,
//             width: double.infinity,
//             child: Image.asset("assets/giffycanvas.gif",
//                 gaplessPlayback: true, fit: BoxFit.fill)
//             // return AnimatedSplashScreen(
//             //   nextScreen: Login(),
//             //   splash: Column(
//             //     children: [
//             //       Image.asset(
//             //         'assets/futurenselogo.png',
//             //       ),
//             //     ],
//             //   ),
//             //   backgroundColor: const Color(0xffFDBA2F),
//             //   splashIconSize: 250,
//             //   duration: 3000,
//             //   splashTransition: SplashTransition.slideTransition,
//             //   // pageTransitionType: PageTransitionType.scale,
//             // );
//             ));
//   }
// }
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(
    //     const Duration(seconds: 4),
    //     () => Navigator.pushReplacement(
    //           context,
    //           MaterialPageRoute(builder: (context) => const Login()),
    //         ));
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => Login(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset("assets/giffycanvas.gif",
              gaplessPlayback: true, fit: BoxFit.fill),

          // );
        ));
  }
}
