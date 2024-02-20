import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../layout/screen_layout.dart';

// ignore: camel_case_types
class helpcenter extends StatefulWidget {
  const helpcenter({super.key});

  @override
  State<helpcenter> createState() => _helpcenterState();
}

// ignore: camel_case_types
class _helpcenterState extends State<helpcenter> {
  String cn = 'Social Media';
  String save = 'Common Questions';

  Widget listTile(
      {required IconData icon, required String title, required onTab1}) {
    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
          onTap: onTab1,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
              colors: [
                Color(0xffFFB200),
                Color(0xffFFDE00),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          )),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 28,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => const ScreenLayout(),
                ),
              );
            },
          ),
          title: const Text(
            "FAQs",
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  child: Text(
                    save,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    cn,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
              indicatorColor: const Color(0xff277BC0),
            ),
            Expanded(
              child: TabBarView(children: [
                Container(
                  color: const Color(0xffFFF4CF),
                  child: ListView(
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            clipBehavior: Clip.antiAlias,
                            margin: EdgeInsets.zero,
                            child: ExpansionTile(
                              title: const Text(
                                "What is Feed Forward?",
                                style: TextStyle(fontSize: 14),
                              ),
                              collapsedBackgroundColor: const Color(0xffFFFAE7),
                              collapsedTextColor: Colors.black,
                              collapsedIconColor: Colors.grey,
                              iconColor: Colors.black,
                              textColor: Colors.black,
                              backgroundColor: const Color(0xffFFFAE7),
                              children: [
                                Divider(color: Colors.grey.shade500),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  child: Text(
                                    "Feed Forward is a mobile app that connects NGO's and individuals with surplus food to donate with those in need of it. The app also allows users to request assistance with food and make monetary donations to support the app's mission.",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            clipBehavior: Clip.antiAlias,
                            margin: EdgeInsets.zero,
                            child: ExpansionTile(
                              title: const Text(
                                "Is the food donated through Feed Forward safe to consume?",
                                style: TextStyle(fontSize: 14),
                              ),
                              collapsedBackgroundColor: const Color(0xffFFFAE7),
                              collapsedTextColor: Colors.black,
                              collapsedIconColor: Colors.grey,
                              iconColor: Colors.black,
                              textColor: Colors.black,
                              backgroundColor: const Color(0xffFFFAE7),
                              children: [
                                Divider(color: Colors.grey.shade500),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  child: Text(
                                    "Yes, the app includes a quality review feature that allows users to rate the food they receive on a daily basis, helping to ensure that donated food is of high quality and safe to consume.",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            clipBehavior: Clip.antiAlias,
                            margin: EdgeInsets.zero,
                            child: ExpansionTile(
                              title: const Text(
                                "Can anyone donate food through the app?",
                                style: TextStyle(fontSize: 14),
                              ),
                              collapsedBackgroundColor: const Color(0xffFFFAE7),
                              collapsedTextColor: Colors.black,
                              collapsedIconColor: Colors.grey,
                              iconColor: Colors.black,
                              textColor: Colors.black,
                              backgroundColor: const Color(0xffFFFAE7),
                              children: [
                                Divider(color: Colors.grey.shade500),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  child: Text(
                                    "Yes, anyone can donate surplus food through Feed Forward, including restaurants, grocery stores, and individuals.",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            clipBehavior: Clip.antiAlias,
                            margin: EdgeInsets.zero,
                            child: ExpansionTile(
                              title: const Text(
                                "How does Feed Forward ensure that donated food reaches those in need?",
                                style: TextStyle(fontSize: 14),
                              ),
                              collapsedBackgroundColor: const Color(0xffFFFAE7),
                              collapsedTextColor: Colors.black,
                              collapsedIconColor: Colors.grey,
                              iconColor: Colors.black,
                              textColor: Colors.black,
                              backgroundColor: const Color(0xffFFFAE7),
                              children: [
                                Divider(color: Colors.grey.shade500),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  child: Text(
                                    "The app partners with local NGOs and charitable organizations to ensure that donated food is distributed to those in need in a safe and efficient manner. Users can also track the progress of their donations through the app.",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            clipBehavior: Clip.antiAlias,
                            margin: EdgeInsets.zero,
                            child: ExpansionTile(
                              title: const Text(
                                "How is Feed Forward funded?",
                                style: TextStyle(fontSize: 14),
                              ),
                              collapsedBackgroundColor: const Color(0xffFFFAE7),
                              collapsedTextColor: Colors.black,
                              collapsedIconColor: Colors.grey,
                              iconColor: Colors.black,
                              textColor: Colors.black,
                              backgroundColor: const Color(0xffFFFAE7),
                              children: [
                                Divider(color: Colors.grey.shade500),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  child: Text(
                                    "Feed Forward relies on a combination of monetary donations and grants to cover its operational costs and support its mission. The app also partners with NGO's and other organizations to promote food donation and reduce waste.",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                    child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: const Color(0xffFFFAE7),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const ListTile(
                            leading: Icon(
                              Icons.facebook,
                              color: Color(0xff277BC0),
                            ),
                            title: Text(
                              'Facebook',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: const Color(0xffFFFAE7),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const ListTile(
                            leading: Icon(
                              Icons.apple,
                              color: Color(0xff277BC0),
                            ),
                            title: Text(
                              'Apple Id',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: const Color(0xffFFFAE7),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const ListTile(
                            leading: Icon(
                              FontAwesomeIcons.google,
                              color: Color(0xff277BC0),
                            ),
                            title: Text(
                              'Gmail',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: const Color(0xffFFFAE7),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const ListTile(
                            leading: Icon(
                              FontAwesomeIcons.instagram,
                              color: Color(0xff277BC0),
                            ),
                            title: Text(
                              'Instagram',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ]))
              ]),
            )
          ],
        ),
      ),
    );
  }
}
