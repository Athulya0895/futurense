import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/profile/profile_image.dart';

import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/screens/mentee/mentee_review/mentee_review_vm.dart';
import 'package:readmore/readmore.dart';

class MenteeReview extends StatefulWidget {
  final MentorModel? menteedetails;
  const MenteeReview({super.key, this.menteedetails});

  @override
  State<MenteeReview> createState() => _MenteeReviewState();
}

class _MenteeReviewState extends State<MenteeReview>
    with BasePage<MenteeReviewVM> {
  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
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
                  "Reviews",
                  style: TextStyle(
                      color: Color(0xffFDBA2F),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                leading: const BackButtonCustom(),
                backgroundColor: Colors.white,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                )),
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              // margin:
              //     EdgeInsets.symmetric(vertical: 10, horizontal: 10)
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  headerdetailmentor(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Reviews",
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: provider.reviewsList?.feedbacksBy?.length ?? 0,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color:
                                    const Color(0xffBDBCBC).withOpacity(0.25),
                                spreadRadius: 0,
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                                blurStyle: BlurStyle.normal),
                          ],
                        ),
                        child: Row(
                          children: [
                            ProfileImage(
                              url: provider
                                  .reviewsList?.feedbacksBy?[index].profilePic,
                            ),
                            // SvgPicture.asset("assets/profile.svg"),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // provider.reviewsList
                                        //         ?.feedbacksBy?[index].name
                                        //         .toString() ??
                                        //     "",

                                        provider.reviewsList!
                                                    .feedbacksBy![index].name
                                                    .toString()
                                                    .length <
                                                16
                                            ? "${provider.reviewsList?.feedbacksBy![index].name},"
                                            : "${provider.reviewsList?.feedbacksBy![index].name!.substring(0, 16)}...",

                                        style:
                                            TextStyle(color: Colors.grey[500]),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      RatingBarIndicator(
                                        rating: double.parse(provider
                                                .reviewsList
                                                ?.feedbacksBy?[index]
                                                .rating ??
                                            ""),
                                        itemBuilder: (context, index) =>
                                            const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 16.0,
                                        direction: Axis.horizontal,
                                      ),
                                    ],
                                  ),
                                  // Text('Very interactive and detailed ..'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // ViewMore(
                                  //     text: provider.reviewsList
                                  //             ?.feedbacksBy?[index].review ??
                                  //         "")
                                  showMoretext(provider.reviewsList
                                          ?.feedbacksBy?[index].review ??
                                      ""),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        )));
  }

//header details of mentee
  Widget headerdetailmentor() {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          ProfileImage(url: widget.menteedetails?.profilePic),
          const SizedBox(
            height: 15,
          ),
          Text(
            "${widget.menteedetails?.fName.toString()} ${widget.menteedetails?.lName.toString()}",
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            widget.menteedetails?.designationName ?? "-",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            widget.menteedetails?.email.toString() ?? "email@example.com",
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color(0xff7AC4C8)),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: const Color(0xffEBF6F7),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "4.9",
                  style: TextStyle(
                      color: Color(0xff6EBFC3),
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  width: 20,
                ),
                RatingBarIndicator(
                  rating: 4.9,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget showMoretext(String text) {
    return ReadMoreText(
      text,
      style:const TextStyle(color: Color(0xff6B779A)),
      trimLines: 2,
      colorClickableText: Colors.pink,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'View More',
      trimExpandedText: 'Show less',
      moreStyle:const TextStyle(
          color: Color(0xff682FFD),
          decoration: TextDecoration.underline,
          fontSize: 12),
    );
  }

  @override
  MenteeReviewVM create() => MenteeReviewVM();

  @override
  void initialise(BuildContext context) {
    provider.mentee = widget.menteedetails;
  }
}
