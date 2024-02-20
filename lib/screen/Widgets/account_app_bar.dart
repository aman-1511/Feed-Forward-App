import 'package:flutter/material.dart';
import 'package:food_donation/screen1/search_screen.dart';

class AccountScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  AccountScreenAppBar({Key? key})
      : preferredSize = const Size.fromHeight(100),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      //padding: const EdgeInsets.only(top: 40),
      height: 100,
      width: screenSize.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color(0xffFFB200),
          // Color(0xffFEB139),
          Color(0xffFFDE00),
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      )
          //color: Colors.amber,
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              "images/dov.png",
              height: screenSize.height * 0.7,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.search_outlined,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
