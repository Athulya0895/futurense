import 'package:flutter/material.dart';

class ViewMore extends StatefulWidget {
  final String text;
  const ViewMore({super.key, required this.text});

  @override
  State<ViewMore> createState() => _ViewMoreState();
}

class _ViewMoreState extends State<ViewMore> {
  String firstHalf = '';
  String secondHalf = '';
  bool flag = true;

  @override
  void initState() {
    if (widget.text.length > 40) {
      firstHalf = widget.text.substring(0, 30);
      secondHalf = widget.text.substring(30, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(flag ? ("$firstHalf...") : (firstHalf + secondHalf),
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Color(0xff6B779A))),
        const SizedBox(
          height: 5,
        ),
        InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                flag ? "View More " : "show Less",
                style: const TextStyle(
                    color: Color(0xff682FFD),
                    decoration: TextDecoration.underline,
                    fontSize: 12),
              ),
            ],
          ),
          onTap: () {
            setState(() {
              flag = !flag;
            });
          },
        ),
      ],
    );
  }
}
