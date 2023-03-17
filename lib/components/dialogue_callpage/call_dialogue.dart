import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyDialogWidget extends StatefulWidget {
  final String text;
  final Widget lottieWidget;
  bool shouldShowButton;
  final Function? buttonpressResume;
  final Function? buttonpressEndcall;

  MyDialogWidget({
    required this.text,
    required this.lottieWidget,
    required this.shouldShowButton,
    this.buttonpressResume,
    this.buttonpressEndcall,
  });
  @override
  _MyDialogWidgetState createState() => _MyDialogWidgetState();
}

class _MyDialogWidgetState extends State<MyDialogWidget> {
  // var shouldShowButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // contentPadding: EdgeInsets.all(10),
      insetPadding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      title: Align(
        alignment: Alignment.topRight,
        child: Container(
          // padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffD8D8D8),
              ),
              shape: BoxShape.circle),
          child: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Color(0xffD8D8D8),
              )),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          widget.lottieWidget,
          Text(textAlign: TextAlign.center, widget.text),
          SizedBox(
            height: 20,
          ),
          Visibility(
            visible: widget.shouldShowButton,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: cro,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff6EBFC3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    // handle "Yes" button press
                    widget.buttonpressResume!();
                  },
                  icon: Container(
                      margin: EdgeInsets.only(bottom: 8, top: 8),
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Icon(
                        Icons.check,
                        color: Color(0xff6EBFC3),
                      )), // "tick" icon on the left side
                  label: Text(
                    'Resume',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffFF5458),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    // handle "No" button press
                    widget.buttonpressEndcall!();
                  },
                  icon: Container(
                      margin: EdgeInsets.only(bottom: 8, top: 8),
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Icon(
                        Icons.close,
                        color: Colors.red,
                      )), // "cross" icon on the left side
                  label: Text('End Call'),
                ),
              ],
            ),
          ),
        ],
      ),
      // actions: <Widget>[
      //   TextButton(
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //     child: Text('Close'),
      //   ),
      // ],
    );
  }
}
