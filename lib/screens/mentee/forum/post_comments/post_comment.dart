import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/profile/profile_image.dart';
import 'package:futurensemobileapp/models/feed_model.dart';
import 'package:futurensemobileapp/screens/mentee/forum/post_comments/post_comment_vm.dart';
import 'package:readmore/readmore.dart';

class PostComment extends StatefulWidget {
  FeedPost? feedpost;
  String? tag;
  bool? isExpanded;
  bool? isReplyComment;
  PostComment(
      {super.key,
      required this.feedpost,
      this.tag,
      this.isExpanded,
      this.isReplyComment});

  @override
  State<PostComment> createState() => _PostCommentState();
}

class _PostCommentState extends State<PostComment>
    with BasePage<PostCommentVM> {
  bool _isExpanded = false;
  bool isReplysubComment = false;
  void addComment() {
    setState(() {
      widget.feedpost?.comments?.add(CommentsModel(
          comment: provider.replyController.text,
          commentorId: "",
          commentorName: "aby",
          commentorProfile: "",
          hoursAgo: "wwwwww"));
      widget.isReplyComment = false;
    });
    provider.replyController.clear();
    widget.isReplyComment = false;
  }

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
                // title: const Center(
                //   child: Text(
                //     "Join the Conversation",
                //     style: TextStyle(
                //         color: Color(0xffFDBA2F),
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold),
                //   ),
                // ),
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
          body: Padding(
            padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Post container widget
                  Hero(
                      tag: widget.tag.toString(),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        child: Container(
                          // duration: const Duration(milliseconds: 2000),
                          // curve: Curves.easeInOut,
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
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // "Interaction Designer, Mentee",
                                        "${widget.feedpost?.designation},${widget.feedpost?.userType}",
                                        style: const TextStyle(
                                            color: Color(0xff979797),
                                            fontSize: 10),
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
                                              size: 15,
                                              color: Color(0xffD8D8D8)),
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
                                    "${widget.feedpost?.title}",
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
                                          image:
                                              AssetImage("assets/forumn.png"),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                                    // provider.likePost(index);
                                                  },
                                                  icon: Icon(
                                                    // Icons.thumb_up,
                                                    widget.feedpost?.isLiked ==
                                                            true
                                                        ? Icons.thumb_up
                                                        : Icons
                                                            .thumb_up_outlined,
                                                    size: 16,
                                                    color: widget.feedpost
                                                                ?.isLiked ==
                                                            true
                                                        ? const Color(
                                                            0xffFDBA2F)
                                                        : const Color(
                                                            0xff979797),
                                                  ))),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            // '$provider.likeCount',
                                            '${widget.feedpost?.likeCount}',
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
                                                    // setState(() {
                                                    //   provider.posts[index]
                                                    //           .isExpanded =
                                                    //       !provider.posts[index]
                                                    //           .isExpanded;
                                                    // });
                                                    //goto next page hero animation
                                                    // Navigator.push(
                                                    //     context,
                                                    //     MaterialPageRoute(
                                                    //         builder: (context) =>
                                                    //             PostComment(
                                                    //                 tag:
                                                    //                     'post_${index}',
                                                    //                 feedpost: provider
                                                    //                         .posts[
                                                    //                     index])));
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
                                                print("Pressed Reply button");
                                                setState(() {
                                                  widget.isReplyComment = true;
                                                  print(widget.isReplyComment);
                                                  print("reply");
                                                  // !widget.isReplyComment;
                                                });
                                              },
                                              child: const Text(
                                                "Reply",
                                                style: TextStyle(
                                                    color: Color(0xff682FFD),
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                              ],
                            ),
                          ),
                        ), // Post container widget
                      )),
                  // SizedBox(height:6),
                  // Animated container for comments section

                  widget.isReplyComment == true
                      ? InkWell(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffFDBA2F)),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: provider.replyController,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 12.0),
                                      hintText: 'Add a reply.....',
                                      hintStyle: TextStyle(fontSize: 12),
                                      border: InputBorder.none,
                                    ),
                                    minLines: 1,
                                    maxLines: 4,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 16),
                                  decoration: const BoxDecoration(
                                    color: Color(0xffFDBA2F),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16.0),
                                      bottomRight: Radius.circular(16.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'Reply',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            //add comment
                            addComment();
                          },
                        )
                      : SizedBox(),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.feedpost?.comments?.length,
                    itemBuilder: (context, index) {
                      final comment = widget.feedpost!.comments?[index].comment;

                      return Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
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
                              title: Row(
                                children: [
                                  Text(
                                    widget.feedpost!.comments![index]
                                        .commentorName
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff202020)),
                                  ),
                                  const Text(" | "),
                                  Text(
                                    widget.feedpost!.comments![index].hoursAgo
                                        .toString(),
                                    style: const TextStyle(
                                        color: Color(0xff979797),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // "Interaction Designer, Mentee",
                                    comment.toString(),
                                    style: const TextStyle(
                                        color: Color(0xff979797), fontSize: 10),
                                  ),
                                  Row(
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
                                                // provider.likePost(index);
                                              },
                                              icon: Icon(
                                                // Icons.thumb_up,
                                                widget.feedpost?.isLiked == true
                                                    ? Icons.thumb_up
                                                    : Icons.thumb_up_outlined,
                                                size: 16,
                                                color: widget.feedpost
                                                            ?.isLiked ==
                                                        true
                                                    ? const Color(0xffFDBA2F)
                                                    : const Color(0xff979797),
                                              ))),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        // '$provider.likeCount',
                                        '${widget.feedpost?.likeCount}',
                                        style: const TextStyle(
                                            color: Color(0xff6B779A),
                                            fontSize: 10),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            //click on the reply button should goes on sub list
                                            print("print comment");
                                            setState(() {
                                              isReplysubComment =
                                                  !isReplysubComment;
                                              print(isReplysubComment);
                                              print("subreply");
                                              // !widget.isReplyComment;
                                            });
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
                                    ],
                                  )
                                ],
                              )),
                          //clicking on subcomment
                          isReplysubComment == true
                              ? Text("subcomment")
                              : Text("no subcomment"),
                          widget.feedpost!.comments![index].subComments != null
                              ? ListView.builder(
                                  padding: EdgeInsets.only(left: 60),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: widget.feedpost!.comments![index]
                                      .subComments?.length,
                                  itemBuilder: (context, i) {
                                    final subComment = widget.feedpost!
                                        .comments![index].subComments?[i];
                                    return ListTile(
                                        leading: const ProfileImage(
                                          url: "",
                                          heighturl: 37,
                                          widthurl: 37,
                                          heightpng: 37,
                                          widthpng: 37,
                                        ),
                                        title: Row(
                                          children: [
                                            Text(
                                              widget.feedpost!.comments![index]
                                                  .subComments![i].commentorName
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff202020)),
                                            ),
                                            const Text(" | "),
                                            Text(
                                              widget.feedpost!.comments![index]
                                                  .subComments![i].hoursAgo
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Color(0xff979797),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              // "Interaction Designer, Mentee",
                                              subComment.toString(),
                                              style: const TextStyle(
                                                  color: Color(0xff979797),
                                                  fontSize: 10),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: const Color(
                                                              0xffE7CBCB)
                                                          .withOpacity(0.15),
                                                    ),
                                                    child: IconButton(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        constraints:
                                                            const BoxConstraints(),
                                                        onPressed: () {
                                                          //like onpressed
                                                          // provider.likePost(index);
                                                        },
                                                        icon: Icon(
                                                          // Icons.thumb_up,
                                                          widget.feedpost
                                                                      ?.isLiked ==
                                                                  true
                                                              ? Icons.thumb_up
                                                              : Icons
                                                                  .thumb_up_outlined,
                                                          size: 16,
                                                          color: widget.feedpost
                                                                      ?.isLiked ==
                                                                  true
                                                              ? const Color(
                                                                  0xffFDBA2F)
                                                              : const Color(
                                                                  0xff979797),
                                                        ))),
                                                const SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  // '$provider.likeCount',
                                                  '${widget.feedpost?.likeCount}',
                                                  style: const TextStyle(
                                                      color: Color(0xff6B779A),
                                                      fontSize: 10),
                                                ),
                                                TextButton(
                                                    onPressed: () {
                                                      //sub comment button press
                                                      setState(() {
                                                        isReplysubComment =
                                                            !isReplysubComment;
                                                        print(
                                                            isReplysubComment);
                                                        print("subreply");
                                                        // !widget.isReplyComment;
                                                      });
                                                    },
                                                    child: const Text(
                                                      "Reply",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff682FFD),
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )),
                                              ],
                                            )
                                          ],
                                        ));

                                    // );
                                  },
                                )
                              : const SizedBox(),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
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

  @override
  PostCommentVM create() => PostCommentVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
