import 'package:flutter/material.dart';

import 'package:futurensemobileapp/components/input/input_field.dart';
import 'package:futurensemobileapp/utils/validators.dart';

class CancelReschedule extends StatefulWidget {
  final String? headerText;
  final String? buttonText;
  final Function? buttonPress;
  const CancelReschedule(
      {super.key,
      required this.headerText,
      required this.buttonText,
      this.buttonPress});

  @override
  State<CancelReschedule> createState() => _CancelRescheduleState();
}

class _CancelRescheduleState extends State<CancelReschedule> {
  bool isChecked = false;
  String currText = '';
  TextEditingController about = TextEditingController();
  List<String> text = ["Schedule clash", "Personal reasons", "Others"];
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon:const Icon(Icons.close)),
            ),
            Text(
              widget.headerText.toString(),
              style: const TextStyle(
                  color: Color(0xffFDBA2F),
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: text
                  .map((t) => CheckboxListTile(
                        activeColor:const Color(0xffFDBA2F),
                        title: Text(t),
                        value: isChecked,
                        onChanged: (bool? val) {
                          setState(() {
                            isChecked = val!;
                            if (val == true) {
                              currText = t;
                              // print(currText);
                            }
                          });
                        },
                      ))
                  .toList(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Share in detail",
                  style: TextStyle(color: Color(0xff202020), fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding:const EdgeInsets.only(left: 15, right: 15),
              child: InputField(
                maxline: 3,
                // minline: 1,
                hintText: "write the reason for cancellation",
                controller: about,

                validation: Validators.basic,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
                color:const Color(0xffFDBA2F),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                // minWidth: 30,
                // height: 30,
                padding: const EdgeInsets.only(
                  left: 35,
                  right: 35,
                ),
                textColor: Colors.white,

                // color: const Color(0xff6EBFC3),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                  // side: BorderSide(color: Color(0xffFFAA5F), width: 1)
                ),
                child: Text(
                  widget.buttonText.toString(),
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  // widget.buttonPress!();
                  //cancel meeting
                }),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
