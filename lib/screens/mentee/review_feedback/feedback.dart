import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/input/input_field.dart';
import 'package:futurensemobileapp/components/profile/profile_image.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/screens/mentee/review_feedback/feedback_vm.dart';
import 'package:futurensemobileapp/utils/validators.dart';

class FeedbackPage extends StatefulWidget {
  final MeetingModel? mentor;
  FeedbackPage({super.key, required this.mentor});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> with BasePage<FeedbackVM> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color(0xffFFD680),
                    spreadRadius: 0,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                    blurStyle: BlurStyle.normal),
              ],
            ),
            child: AppBar(
              centerTitle: true,
              title: const Text(
                "Feedback",
                style: TextStyle(
                    color: const Color(0xffFDBA2F),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              // leading: const BackButtonCustom(),
              backgroundColor: Colors.white,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(25),
              )),
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileImage(widget.mentor!.profilepic.toString()),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Tell us your experience with",
                    style: TextStyle(color: Color(0xffA0A2B3), fontSize: 18),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.mentor!.userName.toString(),
                    style: TextStyle(
                        color: Color(0xff777A95),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    decoration: BoxDecoration(
                        color: Color(0xffEBF6F7),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        const Text(
                          "Rate here",
                          style: TextStyle(
                              color: Color(0xff6EBFC3),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        RatingBar(
                            initialRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            ratingWidget: RatingWidget(
                                full:
                                    Icon(Icons.star, color: Color(0xffFDBA2F)),
                                half: const Icon(
                                  Icons.star_half,
                                  color: Color(0xffFDBA2F),
                                ),
                                empty: const Icon(
                                  Icons.star_outline,
                                  color: Color(0xffFDBA2F),
                                )),
                            onRatingUpdate: (value) {
                              setState(() {
                                provider.ratingValue = value;
                              });
                              print(provider.ratingValue);
                            }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Write a Review"),
                      Text(
                        "Max 450 Words",
                        style:
                            TextStyle(color: Color(0xffA0A2B3), fontSize: 14),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputField(
                    maxline: 5,
                    // minline: 1,
                    hintText: "",
                    controller: provider.review,

                    validation: Validators.basic,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  MaterialButton(
                      minWidth: MediaQuery.of(context).size.width * 0.7,
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: const Text("Done"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      textColor: Colors.white,
                      color: const Color(0xffFDBA2F),
                      onPressed: () {
                        provider.postFeedback(context,widget.mentor?.channelName.toString());
                      }),
                  // const Text(
                  //     "Would you recommend Pro. Bellamy Nicholas to your friends?"),
                  // Row(
                  //   children: [
                  //     Checkbox(
                  //       checkColor: Colors.white,
                  //       // fillColor:Colors.orange,
                  //       value: isChecked,
                  //       shape: CircleBorder(),
                  //       onChanged: (bool? value) {
                  //         setState(() {
                  //           isChecked = value!;
                  //         });
                  //       },
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ))));
  }

  @override
  FeedbackVM create() => FeedbackVM();

  @override
  void initialise(BuildContext context) {
    provider.mentor = widget.mentor;
  }
}
