import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppointmentSuccess extends StatelessWidget {
  Widget placeHolder(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          Center(
            child: Lottie.asset(
              'assets/success.json',
              repeat: true,
              width: 300,
              height: 300,
              fit: BoxFit.fill,
            ),
          ),
          const Center(
            child: Text(
              "Completed",
              style: TextStyle(color: Color(0xff777A95), fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              "Your appointment  request successfully sent. Pro. Bellamy Nicholas will Contact you soon",
              style: TextStyle(
                  color: Color(0xff777A95),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          MaterialButton(
            minWidth: double.infinity,
            color: const Color(0xffFDBA2F),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Okay",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  const AppointmentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset:const Offset(4, 2),
            blurRadius: 3,
            color: const Color(0xffA0A2B3).withOpacity(0.5),
          )
        ],
      ),
      height: 500,
      width: 300,
      child: placeHolder(context),
    ));
  }
}

// class SucessPopup {
//   // static const router = 'sucess_popup';
//   static show(BuildContext context) {
//     showDialog(
//       context: context,
//       // routeSettings: const RouteSettings(name: SucessPopup.router),
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return Dialog(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           child: Column(
//             children: [
//               Center(
//                 child: Lottie.asset(
//                   'assets/success.json',
//                   repeat: true,
//                   width: 300,
//                   height: 300,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               const Center(
//                 child: Text(
//                   "Successfully sent",
//                   style: TextStyle(color: Color(0xff7E7E7E), fontSize: 12),
//                 ),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
