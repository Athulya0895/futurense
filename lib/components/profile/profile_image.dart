import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String? url;
  final double? heighturl;
  final double? widthurl;
  final double? heightpng;
  final double? widthpng;
  const ProfileImage(
      {Key? key,
      this.url,
      this.heighturl = 75,
      this.widthurl = 75,
      this.heightpng = 70,
      this.widthpng = 70})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.network(
        url ?? '',
        height: heighturl,
        width: widthurl,
        errorBuilder: (_, __, ___) {
          return Image.asset(
            "assets/profile.png",
            fit: BoxFit.cover,
            height: heightpng,
            width: widthpng,
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return const Center(child: CircularProgressIndicator());
        },
        fit: BoxFit.cover,
      ),
    );
  }
}
