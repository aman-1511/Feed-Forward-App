import 'package:flutter/material.dart';
import 'package:food_donation/Horizantal_Category/About.dart';
import 'package:food_donation/Horizantal_Category/Notification.dart';
import 'package:food_donation/Horizantal_Category/chat.dart';
import 'package:food_donation/Horizantal_Category/profile.dart';
import 'package:food_donation/screen1/home_screen.dart';
import 'package:food_donation/screen1/result_screen.dart';
import 'package:food_donation/screen1/search_screen.dart';
import 'package:food_donation/screen1/sign_in.dart';
import 'package:food_donation/utils/utils.dart';
import '../../Horizantal_Category/location.dart';

// ignore: must_be_immutable
class SearchBarWidget extends StatelessWidget with PreferredSizeWidget {
  final bool isReadOnly;
  final bool hasBackButton;
  SearchBarWidget({
    Key? key,
    required this.isReadOnly,
    required this.hasBackButton,
  })  : preferredSize = const Size.fromHeight(100),
        super(key: key);

  @override
  final Size preferredSize;

  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      color: Colors.grey,
      width: 1,
    ),
  );

  @override
  Widget build(BuildContext context) {
    //GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    Widget _openDrawer(context) {
      return Drawer(
        backgroundColor: const Color.fromARGB(255, 239, 234, 209),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 33, 115, 36),
                    Color.fromARGB(255, 114, 243, 118),
                    Color.fromARGB(255, 92, 225, 97),
                  ],
                ),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 43,
                    child: CircleAvatar(
                      backgroundColor: Colors.white54,
                      radius: 40,
                      backgroundImage: AssetImage("images/Logo.png"),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Welcome Guest",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 7),
                      SizedBox(
                        // color: Colors.amber,
                        height: 30,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => const SignInScreen(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          //radius
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const HomeScreen(),
                  ),
                );
              },
              leading: const Icon(
                Icons.home_outlined,
                color: Color.fromARGB(136, 0, 0, 0),
                size: 30,
              ),
              title: const Text(
                "Home Page",
                style: TextStyle(
                  color: Color.fromARGB(255, 47, 45, 45),
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => ChatScreen(),
                  ),
                );
              },
              leading: const Icon(
                Icons.contact_phone_outlined,
                color: Color.fromARGB(136, 0, 0, 0),
                size: 30,
              ),
              title: const Text(
                "Contact Us",
                style: TextStyle(
                  color: Color.fromARGB(255, 47, 45, 45),
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const About(),
                  ),
                );
              },
              leading: const Icon(
                Icons.info_outline,
                color: Color.fromARGB(136, 0, 0, 0),
                size: 30,
              ),
              title: const Text(
                "About Us",
                style: TextStyle(
                  color: Color.fromARGB(255, 47, 45, 45),
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const MyProfile(),
                  ),
                );
              },
              leading: const Icon(
                Icons.person_outline,
                color: Color.fromARGB(136, 0, 0, 0),
                size: 30,
              ),
              title: const Text(
                "My Profile",
                style: TextStyle(
                  color: Color.fromARGB(255, 47, 45, 45),
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (ctx) => const Contact(),
                //   ),
                // );
              },
              leading: const Icon(
                Icons.star_border_outlined,
                color: Color.fromARGB(136, 0, 0, 0),
                size: 30,
              ),
              title: const Text(
                "Review & Rating",
                style: TextStyle(
                  color: Color.fromARGB(255, 47, 45, 45),
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (ctx) => const Payment(),
                //   ),
                // );
              },
              leading: const Icon(
                Icons.work_history_outlined,
                color: Color.fromARGB(136, 0, 0, 0),
                size: 30,
              ),
              title: const Text(
                "History",
                style: TextStyle(
                  color: Color.fromARGB(255, 47, 45, 45),
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (ctx) => ChatScreen(),
                //   ),
                // );
              },
              leading: const Icon(
                Icons.format_quote_outlined,
                color: Color.fromARGB(136, 0, 0, 0),
                size: 30,
              ),
              title: const Text(
                "FAQs",
                style: TextStyle(
                  color: Color.fromARGB(255, 47, 45, 45),
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const SignInScreen(),
                  ),
                );
              },
              leading: const Icon(
                Icons.exit_to_app,
                color: Color.fromARGB(136, 0, 0, 0),
                size: 30,
              ),
              title: const Text(
                "Log Out",
                style: TextStyle(
                  color: Color.fromARGB(255, 47, 45, 45),
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              height: 350,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact Support',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        'Call Us',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.5,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "91+ 8418885752",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const Text(
                          "Mail Us:",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.5,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          child: const SizedBox(width: 10),
                          onTap: () {},
                        ),
                        Text(
                          "zerohunger.mtmk@gmail.com",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Size screenSize = Utils().getScreenSize();
    return SafeArea(
      child: Container(
        height: screenSize.height,
        width: screenSize.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffFFB200),
              // Color(0xffFEB139),
              Color(0xffFFDE00),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            hasBackButton
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  )
                //: Container(),
                : IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(
                      Icons.sort,
                      size: 28,
                      color: Colors.black,
                    ),
                  ),
            SizedBox(
              width: 200,
              height: 50,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      spreadRadius: 1,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: TextField(
                    onSubmitted: (String query) {
                      print("submittrd ${query}");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultsScreen(query: query),
                        ),
                      );
                    },
                    readOnly: isReadOnly,
                    onTap: () {
                      if (isReadOnly) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchScreen(),
                          ),
                        );
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Search',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none, // Set border side to none
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const MapScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.location_on_outlined,
                size: 28,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const NotificationPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.notifications_none_outlined,
                size: 28,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
