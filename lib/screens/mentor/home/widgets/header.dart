import 'package:flutter/material.dart';
import 'package:futurensemobileapp/components/theme/extension.dart';
import 'package:futurensemobileapp/models/user_model.dart';
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
          ProfileImage(user?.profilePic),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(user?.mentorFirstName.toString() ?? "",
                  style: const TextStyle(
                    color: Color(0xff202020),
                    fontSize: 18,
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Thanks for joining the mentorship\n Programme",
                // style: TextStyles.h1Style
                style: TextStyle(color: Color(0xff979797), fontSize: 14),
              ),
            ],
          ).p16,
        ],
      ),
    );
  }
}
