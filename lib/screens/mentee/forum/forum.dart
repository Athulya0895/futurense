import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/profile/profile_image.dart';
import 'package:futurensemobileapp/components/theme/extension.dart';
import 'package:futurensemobileapp/components/theme/text_styles.dart';
import 'package:futurensemobileapp/screens/mentee/forum/forum_vm.dart';
import 'package:futurensemobileapp/screens/mentee/forum/post_comments/post_comment.dart';
import 'package:futurensemobileapp/screens/mentee/forum/writepost/write_post.dart';
import 'package:futurensemobileapp/screens/mentee/home/widget/search_mentee.dart';
import 'package:futurensemobileapp/screens/mentor/coming_soon/coming_soon.dart';
import 'package:readmore/readmore.dart';

class ForumMentee extends StatefulWidget {
  final jumbToIndex;
  const ForumMentee({super.key, this.jumbToIndex});

  @override
  State<ForumMentee> createState() => _ForumMenteeState();
}

class _ForumMenteeState extends State<ForumMentee>
    with BasePage<ForumMenteeVM> {
  bool _isExpanded = false;
  // PostComment isliked = PostComment();
  bool isReplyComment = false;

  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
        backgroundColor: Colors.white,
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
              title: const Center(
                child: Text(
                  "Join the Conversation",
                  style: TextStyle(
                      color: Color(0xffFDBA2F),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
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
        body: ListView(
          padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              children: [
                const ProfileImage(
                  url: "",
                  heighturl: 47,
                  widthurl: 47,
                  heightpng: 47,
                  widthpng: 47,
                ),
                // SearchMentee(topmentorlist: provider.topMentorList),
                Expanded(child: _searchField()),
              ],
            ),
            TextButton(
              onPressed: () {
                // Add your onPressed function here
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => WritePost())));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'ADD NEW',
                    style: TextStyle(
                        color: Color(0xffFF7901),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 5.0),
                  Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffE7CBCB).withOpacity(0.15),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Color(0xffFF7901),
                      )),
                ],
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Hero(
                    tag: 'post_${index}',
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      height: _isExpanded ? 800 : 420,
                      // padding: EdgeInsets.symmetric(horizontal: 1, vertical: 5),
                      margin: EdgeInsets.only(bottom: 30),

                      width: double.infinity,
                      // height: 420,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.01),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          // color: Colors.red,
                          border: Border.all(
                              color: Color(0xffFFD680).withOpacity(0.48))),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: const ProfileImage(
                                url: "",
                                heighturl: 47,
                                widthurl: 47,
                                heightpng: 47,
                                widthpng: 47,
                              ),
                              title: const Text(
                                "Oyin Dolapo",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff202020)),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // "Interaction Designer, Mentee",
                                    "${provider.posts[index].designation},${provider.posts[index].userType}",
                                    style: const TextStyle(
                                        color: Color(0xff979797), fontSize: 10),
                                  ),
                                  const Text("Posted 2 hr ago",
                                      style: TextStyle(
                                          color: Color(0xff979797),
                                          fontSize: 8))
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.more_horiz,
                                        color: Color(0xffD8D8D8)),
                                    onPressed: () {
                                      // Do something when the first button is pressed
                                    },
                                  ),
                                  Container(
                                    // padding: const EdgeInsets.all(0.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: const Color(0xffD8D8D8),
                                            width: 1)),
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      icon: const Icon(Icons.close,
                                          size: 15, color: Color(0xffD8D8D8)),
                                      onPressed: () {
                                        // Do something when the second button is pressed
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 6, right: 10),
                              child: Text(
                                // "What is SAP ?",
                                "${provider.posts[index].title}",
                                style: const TextStyle(
                                    color: Color(0xff202020),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 6, right: 10),
                              child: GestureDetector(
                                onTap: (() {
                                  setState(() {
                                    _isExpanded = !_isExpanded;
                                  });
                                }),
                                child: showMoretext(
                                  "SAP stands for system applications and products in data processing. SAP stands for system applications and products in data processing...",
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: double.infinity,
                              height: 200,
                              // color: Colors.red,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/forumn.png"),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: const Color(0xffE7CBCB)
                                                .withOpacity(0.15),
                                          ),
                                          child: IconButton(
                                              padding: EdgeInsets.zero,
                                              constraints:
                                                  const BoxConstraints(),
                                              onPressed: () {
                                                //like onpressed
                                                provider.likePost(index);
                                              },
                                              icon: Icon(
                                                // Icons.thumb_up,
                                                provider.posts[index].isLiked ==
                                                        true
                                                    ? Icons.thumb_up
                                                    : Icons.thumb_up_outlined,
                                                size: 16,
                                                color: provider.posts[index]
                                                            .isLiked ==
                                                        true
                                                    ? const Color(0xffFDBA2F)
                                                    : const Color(0xff979797),
                                              ))),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        // '$provider.likeCount',
                                        '${provider.posts[index].likeCount}',
                                        style: const TextStyle(
                                            color: Color(0xff6B779A),
                                            fontSize: 10),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: const Color(0xffE7CBCB)
                                                .withOpacity(0.15),
                                          ),
                                          child: IconButton(
                                              padding: EdgeInsets.zero,
                                              constraints:
                                                  const BoxConstraints(),
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.favorite,
                                                size: 16,
                                                color: Color(0xffFDBA2F),
                                              ))),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      const Text(
                                        '30',
                                        style: TextStyle(
                                            color: Color(0xff6B779A),
                                            fontSize: 10),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: const Color(0xffE7CBCB)
                                                .withOpacity(0.15),
                                          ),
                                          child: IconButton(
                                              padding: EdgeInsets.zero,
                                              constraints:
                                                  const BoxConstraints(),
                                              onPressed: () {
                                                //message onpressed

                                                setState(() {
                                                  provider.posts[index]
                                                          .isExpanded =
                                                      !provider.posts[index]
                                                          .isExpanded;
                                                  print(provider
                                                      .posts[index].isExpanded);
                                                  isReplyComment = false;
                                                  print("reply comment");
                                                  print(isReplyComment);
                                                  print("reply comment");
                                                });

                                                Navigator.of(context)
                                                    .push(PageRouteBuilder(
                                                  transitionDuration:
                                                      const Duration(
                                                          milliseconds: 1200),
                                                  pageBuilder: (BuildContext
                                                          context,
                                                      Animation<double>
                                                          animation,
                                                      Animation<double>
                                                          secondaryAnimation) {
                                                    return PostComment(
                                                      //               tag:
                                                      tag: 'post_${index}',
                                                      feedpost:
                                                          provider.posts[index],
                                                      isExpanded: provider
                                                          .posts[index]
                                                          .isExpanded,
                                                      isReplyComment:
                                                          isReplyComment,
                                                    );
                                                  },
                                                ));
                                              },
                                              icon: const Icon(
                                                Icons.comment,
                                                size: 16,
                                                color: Color(0xffFDBA2F),
                                              ))),
                                      const Text(
                                        '14',
                                        style: TextStyle(
                                            color: Color(0xff6B779A),
                                            fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              provider.posts[index].isExpanded =
                                                  !provider
                                                      .posts[index].isExpanded;
                                              print(provider
                                                  .posts[index].isExpanded);
                                              isReplyComment = !isReplyComment;
                                              isReplyComment = true;
                                              print("reply comment");
                                              print(isReplyComment);
                                              print("reply comment");
                                            });
                                            // setState(() {

                                            // });

                                            //goto next page hero animation
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             PostComment(
                                            //               tag:
                                            //                   'post_${index}',
                                            //               feedpost: provider
                                            //                   .posts[index],
                                            //               isExpanded: provider
                                            //                   .posts[index]
                                            //                   .isExpanded,
                                            //             )));
                                            Navigator.of(context)
                                                .push(PageRouteBuilder(
                                              transitionDuration:
                                                  const Duration(
                                                      milliseconds: 1200),
                                              pageBuilder: (BuildContext
                                                      context,
                                                  Animation<double> animation,
                                                  Animation<double>
                                                      secondaryAnimation) {
                                                return PostComment(
                                                  //               tag:
                                                  tag: 'post_${index}',
                                                  feedpost:
                                                      provider.posts[index],
                                                  isExpanded: provider
                                                      .posts[index].isExpanded,
                                                  isReplyComment:
                                                      isReplyComment,
                                                );
                                              },
                                            ));
                                          },
                                          child: const Text(
                                            "Reply",
                                            style: TextStyle(
                                                color: Color(0xff682FFD),
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          )),
                                      Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: const Color(0xffE7CBCB)
                                                .withOpacity(0.15),
                                          ),
                                          child: IconButton(
                                              padding: EdgeInsets.zero,
                                              constraints:
                                                  const BoxConstraints(),
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.share,
                                                size: 16,
                                                color: Color(0xff979797),
                                              ))),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      const Text(
                                        '32',
                                        style: TextStyle(
                                            color: Color(0xff6B779A),
                                            fontSize: 10),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            // Visibility(
                            //   visible: provider.posts[index].isExpanded,
                            //   child: Column(
                            //     children: [
                            //       SizedBox(height: 16),
                            //       SizedBox(
                            //         height: 300,
                            //         child: ListView.builder(
                            //           shrinkWrap: true,
                            //           physics: NeverScrollableScrollPhysics(),
                            //           itemCount:
                            //               provider.posts[index].comments?.length,
                            //           itemBuilder: (context, index) {
                            //             final comment = provider.posts[index]
                            //                 .comments?[index].comment;
                            //             // return ListTile(

                            //             //   title: Text(comment.toString()),
                            //             //   subtitle: Text(comment.toString()),
                            //             // );
                            //             return ListTile(
                            //               leading: CircleAvatar(
                            //                 backgroundImage: NetworkImage(provider
                            //                     .posts[index]
                            //                     .comments![index]
                            //                     .commentorProfile
                            //                     .toString()),
                            //               ),
                            //               title: Row(
                            //                 mainAxisAlignment:
                            //                     MainAxisAlignment.spaceBetween,
                            //                 children: [
                            //                   Text(provider.posts[index]
                            //                       .comments![index].commentorName
                            //                       .toString()),
                            //                   Text(provider.posts[index]
                            //                       .comments![index].hoursAgo
                            //                       .toString()),
                            //                 ],
                            //               ),
                            //               subtitle: Column(
                            //                 crossAxisAlignment:
                            //                     CrossAxisAlignment.start,
                            //                 children: [
                            //                   Text(comment.toString()),
                            //                   Row(
                            //                     mainAxisAlignment:
                            //                         MainAxisAlignment
                            //                             .spaceBetween,
                            //                     children: [
                            //                       IconButton(
                            //                         onPressed: () {
                            //                           // handle like button pressed
                            //                         },
                            //                         icon:const Icon(
                            //                             Icons.favorite_border),
                            //                       ),
                            //                       IconButton(
                            //                         onPressed: () {
                            //                           // handle reply button pressed
                            //                         },
                            //                         icon:const Icon(Icons.reply),
                            //                       ),
                            //                     ],
                            //                   ),
                            //                 ],
                            //               ),
                            //             );
                            //           },
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ],
        )
        // const ComingSoon(
        //     text1: "Forum Feature Coming\n Soon!",
        //     text2:
        //         "You will be able to join the\n ongoing tech discussions\n and updates!"),
        )));
  }

  Widget showMoretext(String text) {
    return ReadMoreText(
      text,
      style: const TextStyle(color: Color(0xff202020)),
      trimLines: 2,
      colorClickableText: const Color(0xff682FFD),
      trimMode: TrimMode.Line,
      trimCollapsedText: 'View more',
      trimExpandedText: 'Show less',
      moreStyle: const TextStyle(
        color: Color(0xff682FFD),
        fontSize: 12,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.underline,
      ),
    );
  }

// search
  Widget _searchField() {
    return Container(
      // height: 47,
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      child: IgnorePointer(
        child: TextFormField(
          textInputAction: TextInputAction.search,
          // controller: _doctorName,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 20, top: 10, bottom: 10),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: const Color(0xffEBF6F7),
            hintText: 'Search for Topics, Sub-topics and Posts..',
            hintStyle: const TextStyle(color: Color(0xff6EBFC3), fontSize: 10),
            suffixIcon: Container(
              decoration: BoxDecoration(
                color: const Color(0xff6EBFC3).withOpacity(0.5),
                // borderRadius: BorderRadius.circular(20),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
              ),
              child: IconButton(
                iconSize: 20,
                splashRadius: 20,
                color: const Color(0xff6EBFC3),
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ),
          ),
          // style: GoogleFonts.lato(
          //   fontSize: 18,
          //   fontWeight: FontWeight.w800,
          // ),
          onFieldSubmitted: (String value) {},
        ),
      ),
    );
  }

  @override
  ForumMenteeVM create() => ForumMenteeVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
