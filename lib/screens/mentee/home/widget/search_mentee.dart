import 'package:flutter/material.dart';

import 'package:futurensemobileapp/components/profile/profile_image.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/screens/mentee/mentor_detail/mentor_detail.dart';


class SearchMentee extends StatelessWidget {
  final List<MentorModel> topmentorlist;
  const SearchMentee({super.key, required this.topmentorlist});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        showSearch(
          context: context,
          delegate: CustomSearchDelegate(
              fn: (val) {}, fnUpdate: (val) {}, mentor: topmentorlist),
        );
      }),
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 10, 20, 15),
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
              hintText: 'Search for mentee by Skills, Domain, Job Title..',
              hintStyle:
                  const TextStyle(color: Color(0xff6EBFC3), fontSize: 10),

              // hintStyle: GoogleFonts.lato(
              //   color: Colors.black26,
              //   fontSize: 18,
              //   fontWeight: FontWeight.w800,
              // ),
              suffixIcon: Container(
                decoration: BoxDecoration(
                  color:const Color(0xff6EBFC3).withOpacity(0.5),
                  // borderRadius: BorderRadius.circular(20),
                  borderRadius:const BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                ),
                child: IconButton(
                  iconSize: 20,
                  splashRadius: 20,
                  color:const Color(0xff6EBFC3),
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
      ),
    );
  }
}

//custom search
class CustomSearchDelegate extends SearchDelegate {
  final List<MentorModel> mentor;
  final fn;
  final fnUpdate;
  CustomSearchDelegate(
      {required this.fn, required this.mentor, required this.fnUpdate});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
    // List<MentorModel> mentors = mentor
    //     .where((element) =>
    //         element.fName?.toLowerCase().contains(query.toLowerCase()) ==
    //             true ||
    //         element.designationName
    //                 ?.toLowerCase()
    //                 .contains(query.toLowerCase()) ==
    //             true ||
    //         element.skills?.toLowerCase().contains(query.toLowerCase()) == true)
    //     .toList();
    // fn(query);
    // if (query.length < 3) {
    //   return Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: const <Widget>[
    //       Center(
    //         child: Text(
    //           "Search term must be longer than two letters.",
    //         ),
    //       )
    //     ],
    //   );
    // }

    // return Padding(
    //   padding: const EdgeInsets.only(left: 15, bottom: 40, top: 20),
    //   // implement GridView.builder
    //   child: SizedBox(
    //     height: 500,
    //     child: GridView.builder(
    //         shrinkWrap: true,
    //         physics: const NeverScrollableScrollPhysics(),
    //         gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    //           maxCrossAxisExtent: 200,
    //           childAspectRatio: 3 / 3.9,
    //           crossAxisSpacing: 20,
    //           mainAxisSpacing: 20,
    //         ),
    //         itemCount: mentors.length,
    //         itemBuilder: (BuildContext ctx, index) {
    //           return InkWell(
    //             onTap: (() {
    //               Navigator.push(
    //                   context,
    //                   MaterialPageRoute(
    //                       builder: (context) =>
    //                           MenteeDetail(topmentor: mentors[index])));
    //             }),
    //             child: Stack(
    //               children: [
    //                 Container(
    //                   constraints:
    //                       const BoxConstraints(maxHeight: 200, minHeight: 160),
    //                   alignment: Alignment.center,
    //                   decoration: BoxDecoration(
    //                     color: Colors.white,
    //                     border: Border.all(
    //                         color: const Color(0xff979797).withOpacity(0.1)),
    //                     boxShadow: const <BoxShadow>[
    //                       BoxShadow(
    //                         offset: Offset(0, 2),
    //                         blurStyle: BlurStyle.inner,
    //                         blurRadius: 6,
    //                         spreadRadius: 1.5,
    //                         color: Color(0xffFFD680),
    //                       )
    //                     ],
    //                     borderRadius: BorderRadius.circular(20),
    //                   ),
    //                   child: Column(
    //                     // mainAxisSize: MainAxisSize.min,
    //                     children: [
    //                       const SizedBox(height: 10),
    //                       ProfileImage(mentors[index].profilePic),
    //                       const SizedBox(height: 20),
    //                       Text(
    //                           "${mentors[index].fName.toString()} ${mentors[index].lName.toString()}"),
    //                       Text(mentors[index].designationName.toString()),
    //                       Text(
    //                           mentors[index].rating == null ||
    //                                   mentors[index].reviews == null
    //                               ? "No Reviews"
    //                               : "⭐️ ${mentors[index].rating.toString()}(${mentors[index].reviews.toString()} reviews)",
    //                           style: const TextStyle(color: Color(0xffFD2FE2))),
    //                     ],
    //                   ),
    //                 ),
    //                 Positioned(
    //                   bottom: 5,
    //                   right: 40,
    //                   child: Center(
    //                     child: Container(
    //                       padding: const EdgeInsets.all(10),
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(10),
    //                         color: const Color(0xff6EBFC3),
    //                       ),
    //                       child: const Text(
    //                         "View More",
    //                         style: TextStyle(color: Colors.white),
    //                       ),
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           );
    //         }),
    //   ),
    // );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when someone searches for anything
    List<MentorModel> mentors = mentor
        .where((element) =>
            element.fName
                    ?.toLowerCase()
                    .contains(query.toLowerCase()) ==
                true ||
            element.lName?.toLowerCase().contains(query.toLowerCase()) ==
                true ||
            element.designationName
                    ?.toLowerCase()
                    .contains(query.toLowerCase()) ==
                true ||
            element.skills?.toLowerCase().contains(query.toLowerCase()) ==
                true ||
            element.domainExpertise
                    ?.toLowerCase()
                    .contains(query.toLowerCase()) ==
                true)
        .toList();

    return ListView.separated(
        // shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 5,
          );
        },
        itemCount: mentors.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MentorDetails(topmentor: mentors[index])));
            }),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileImage(url:mentors[index].profilePic),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${mentors[index].fName} ${mentors[index].lName}"),
                      Text("${mentors[index].designationName}")
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
