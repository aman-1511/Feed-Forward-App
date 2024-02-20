import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  final String title;
  TopTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 400,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      // color: Color(0xFF4CAF50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 35,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          // Text(
          //   subTitle,
          //   style: TextStyle(
          //     fontSize: 30,
          //     color: Theme.of(context).primaryColor,
          //   ),
          // ),
        ],
      ),
    );
  }
}
