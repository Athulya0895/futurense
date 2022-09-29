import 'package:flutter/material.dart';

class BackButtonCustom extends StatelessWidget {
  const BackButtonCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            child: Material(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const SizedBox(
                    height: 100,
                    width: 100,
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(0xff202020),
                    ),
                  ),
                ),
                color: const Color(0xffFDBA2F)),
            decoration: BoxDecoration(
              // shape: BoxShape.circle,

              // color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: Offset(1, 1), color: Colors.grey, blurRadius: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
