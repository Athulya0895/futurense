import 'package:flutter/material.dart';

import 'package:futurensemobileapp/components/profile/profile_image.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/screens/mentor/mentee_detail/mentee_detail.dart';

class Search extends StatelessWidget {
  final List<MentorModel> topmenteelist;
  const Search({super.key, required this.topmenteelist});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        showSearch(
          context: context,
          delegate: CustomSearchDelegate(
              fn: (val) {}, fnUpdate: (val) {}, mentee: topmenteelist),
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
  final List<MentorModel> mentee;
  final fn;
  final fnUpdate;
  CustomSearchDelegate(
      {required this.fn, required this.mentee, required this.fnUpdate});

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
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when someone searches for anything
    List<MentorModel> mentors = mentee
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
                          MenteeDetail(topmentor: mentors[index])));
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
