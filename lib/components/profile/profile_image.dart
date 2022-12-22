import 'package:flutter/material.dart';


class ProfileImage extends StatelessWidget {
  final String? url;

  const ProfileImage(this.url, {super.key});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.network(
        url ?? '',
        height: 75,
        width: 75,
        errorBuilder: (_, __, ___) {
          return Image.asset(
            "assets/profile.png",
            fit: BoxFit.cover,
            height: 70,
            width: 70,
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
