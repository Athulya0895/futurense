import 'package:flutter/material.dart';
import 'package:futurensemobileapp/components/theme/extension.dart';
import 'package:futurensemobileapp/models/user_model.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../components/profile/profile_image.dart';

class Header extends StatelessWidget {
  final UserModel? user;
  const Header({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        children: [
          ProfileImage(url:user?.profilePic),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // "Hello, ${.user?.mentorFirstName.toString()} ${user?.mentorLastName.toString()}"
                Text(
                  "Hello, ${user?.mentorFirstName.toString()} ${user?.mentorLastName.toString()}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Thanks for joining the mentorship\n Program",
                  // style: TextStyles.h1Style
                  style: TextStyle(color: Color(0xff979797), fontSize: 14),
                ),
              ],
            ).p16,
          ),
        ],
      ),
    );
  }
}
