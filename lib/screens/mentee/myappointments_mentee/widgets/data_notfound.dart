import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class DataNotFound extends StatelessWidget {
  final String? nodataimg;
  final String? cancelledText1;
  final String? cancelledText2;
  final String? buttonText;
  final Function? buttonpress;
  const DataNotFound(
      {super.key,
      required this.nodataimg,
      required this.cancelledText1,
      required this.cancelledText2,
      this.buttonText,
      this.buttonpress});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(nodataimg ?? ""
            // "assets/cancelledimg.svg",
            // width: 34,
            // height: 34,
            ),
        Text(
          cancelledText1 ?? "",
          style:const TextStyle(color: Color(0xff6EBFC3), fontSize: 20),
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          cancelledText2 ?? "",
          style: const TextStyle(color: Color(0xffA0A2B3), fontSize: 14),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 30,
        ),
        buttonText != null
            ? MaterialButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                // minWidth: 30,
                // height: 30,
                padding: const EdgeInsets.only(
                  left: 35,
                  right: 35,
                ),
                textColor: const Color(0xffFFAA5F),

                // color: const Color(0xff6EBFC3),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                    side: BorderSide(color: Color(0xffFFAA5F), width: 1)),
                child: Text(
                  buttonText ?? "",
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  buttonpress!();
                })
            :const SizedBox()
      ],
    );
  }
}
