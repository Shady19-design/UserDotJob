import 'package:flutter/material.dart';

class ShowAllUsersList extends StatelessWidget {
  const ShowAllUsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 10),
          child: Container(
            height: 200,
            width: 150,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      'assets/Images/blank-profile-picture-973460_1280.png')),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            height: 200,
            width: 150,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      'assets/Images/blank-profile-picture-973460_1280.png')),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
