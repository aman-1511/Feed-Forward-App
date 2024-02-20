import 'package:flutter/material.dart';
import 'package:food_donation/layout/screen_layout.dart';
import 'package:food_donation/screen/homepage.dart';
import 'package:food_donation/screen1/home_screen.dart';

import '../layout/screen_layout.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget listTile({required IconData icon, required String title}) {
    return Column(
      children: [
        const Divider(
          height: 0.5,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: const Icon(
            Icons.arrow_forward_ios,
          ),
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    //var userData = widget.userProvider.currentUserData;

    return Scaffold(
      backgroundColor: const Color(0xffFFF4CF),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(120, 0, 0, 0),
                blurRadius: 20,
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xffFFB200),
                // Color(0xffFEB139),
                Color(0xffFFDE00),
              ],
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => const ScreenLayout(),
              ),
            );
          },
        ),
        //elevation: 0.0,

        title: const Text(
          "Profile Page",
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 140,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffFFB200),
                        Color(0xffFEB139),
                        Color(0xffFFDE00),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(80),
                      bottomRight: Radius.circular(80),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  //height: 548,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(98, 210, 206, 185),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 250,
                            height: 80,
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      // userData.userName,
                                      "Mayank Kumar Shah",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    //Text(userData.userEmail),
                                    Text("test@gmail.com")
                                  ],
                                ),
                                const CircleAvatar(
                                  radius: 15,
                                  backgroundColor:
                                      Color.fromARGB(255, 184, 190, 190),
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xffFFFAE7),
                                    child: Icon(
                                      Icons.edit,
                                      size: 16,
                                      color: Color.fromARGB(255, 31, 35, 33),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      listTile(
                          icon: Icons.currency_rupee, title: "Amount Donated"),
                      listTile(
                          icon: Icons.location_on_outlined,
                          title: "My Address"),
                      listTile(
                          icon: Icons.person_outline, title: "Refer A Friends"),
                      listTile(
                          icon: Icons.file_copy_outlined,
                          title: "Terms & Conditions"),
                      listTile(
                          icon: Icons.policy_outlined, title: "Privacy Policy"),
                      listTile(icon: Icons.info_outline, title: "About"),
                      listTile(
                          icon: Icons.exit_to_app_outlined, title: "Log Out"),
                    ],
                  ),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 100, left: 50),
            child: CircleAvatar(
              radius: 50,
              // backgroundColor: Color(0xff277BC0),
              backgroundColor: Color.fromARGB(20, 0, 0, 0),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  // userData.userImage ??
                  "images/man.png",
                ),
                radius: 48,
                backgroundColor: Colors.transparent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
