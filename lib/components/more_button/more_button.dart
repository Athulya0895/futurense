import 'package:flutter/material.dart';

class MoreButtonCustom extends StatelessWidget {
  // final Function? fn;
  const MoreButtonCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(1, 1), color: Colors.grey, blurRadius: 5),
                ]),
            child: const Material(
              color: Colors.transparent,
              child: SizedBox(
                height: 100,
                width: 100,
                child: Icon(
                  Icons.more_vert,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
        ),
      ),
    );
    // return Material(
    //   shape: BoxShape.circle,
    //   child: InkWell(
    //     onTap: () {},
    //     child: Container(
    //       margin: EdgeInsets.all(5),
    //       decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
    //       padding: EdgeInsets.all(10),
    //       child: Center(
    //         child: Icon(Icons.arrow_back, color: Colors.orange),
    //         // child: IconButton(
    //         //   icon: const Icon(Icons.arrow_back, color: Colors.orange),
    //         //   onPressed: () {
    //         //     Navigator.pop(context);
    //         //   },
    //         // ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
