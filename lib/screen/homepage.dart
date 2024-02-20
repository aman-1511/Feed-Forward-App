import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_donation/Horizantal_Category/About.dart';
import 'package:food_donation/screen1/sign_in.dart';
import '../Horizantal_Category/location.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List imageList = [
    {"id": 1, "image_path": 'images/logo.jpg'},
    {"id": 2, "image_path": 'images/Banner1.jpg'},
    {"id": 3, "image_path": 'images/Banner2.webp'},
    {"id": 4, "image_path": 'images/Banner3.jpg'},
    {"id": 5, "image_path": 'images/Banner4.webp'},
    {"id": 6, "image_path": 'images/Banner5.jpg'},
  ];

  final CarouselController carouselController = CarouselController();

  int currIndex = 0;

  Widget _buildSingleFeature({
    required String title,
    required String Subtitle,
    required String image,
  }) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(
                    2.0,
                    2.0,
                  ),
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            height: 250,
            width: 250,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            //margin: const EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    Subtitle,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  // Container(
                  //   height: 50,
                  //   width: double.infinity,
                  //   child: Row(
                  //     children: [
                  //       const Icon(
                  //         Icons.star,
                  //         color: Colors.amber,
                  //         size: 25,
                  //       ),
                  //       Text(
                  //         rating,
                  //         style: const TextStyle(
                  //           fontSize: 13,
                  //           color: Colors.grey,
                  //         ),
                  //       ),
                  //       const SizedBox(width: 45),
                  //       Text(
                  //         amount,
                  //         style: const TextStyle(
                  //           fontSize: 22,
                  //           fontWeight: FontWeight.w900,
                  //           color: Colors.blue,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
        CircleAvatar(
          maxRadius: 70,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage("images/$image.png"),
        ),
      ],
    );
  }

  Widget _buildSingleCategory({required String image, required String name}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 200,
        width: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 130,
              width: 120,
              //color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/$image.png'),
                      ),
                    ),
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _slidingBanner() {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            print(currIndex);
          },
          child: CarouselSlider(
            items: imageList
                .map(
                  (item) => Image.asset(
                    item['image_path'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                )
                .toList(),
            carouselController: carouselController,
            options: CarouselOptions(
              scrollPhysics: const BouncingScrollPhysics(),
              autoPlay: false,
              aspectRatio: 2,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currIndex = index;
                });
              },
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.asMap().entries.map((entry) {
              print(entry);
              print(entry.key);
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: currIndex == entry.key ? 17 : 7,
                  height: 7,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currIndex == entry.key
                          ? Color.fromARGB(255, 11, 14, 17)
                          : Colors.white),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _staticBanner() {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      // ignore: prefer_const_literals_to_create_immutables
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const CircleAvatar(
            maxRadius: 45,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            child: CircleAvatar(
              maxRadius: 42,
              backgroundImage: AssetImage("images/Logo.png"),
            ),
          ),
          Container(
            height: 80,
            width: 200,
            //color: Colors.amberAccent,
            child: const ListTile(
              title: Text(
                "The app's goal is to ensure no one leaves Hungary",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _navBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 48,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              icon: const Icon(
                Icons.sort,
                size: 28,
                color: Color.fromARGB(230, 0, 0, 0),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => MapScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.location_on,
                    size: 28,
                    color: Color.fromARGB(230, 0, 0, 0),
                  ),
                ),
              ),
              Container(
                child: IconButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  icon: const Icon(
                    Icons.notifications,
                    size: 28,
                    color: Color.fromARGB(230, 0, 0, 0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _toBar(context) {
    return Container(
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
      child: Column(
        children: [
          _navBar(),
          Container(
            //color: Colors.amber,
            child: Column(
              children: [
                //_staticBanner(),
                _slidingBanner(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _categorySection() {
    return Container(
      width: double.infinity,
      height: 250,
      // color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              height: 250,
              //width: 752,
              //color: Colors.amber,
              child: Row(
                children: [
                  _buildSingleCategory(
                    image: 'Logo',
                    name: "NGO's",
                  ),
                  const SizedBox(width: 20),
                  _buildSingleCategory(
                    image: 'Logo',
                    name: "NGO's",
                  ),
                  const SizedBox(width: 20),
                  _buildSingleCategory(
                    image: 'Logo',
                    name: "NGO's",
                  ),
                  const SizedBox(width: 20),
                  _buildSingleCategory(
                    image: 'Logo',
                    name: "NGO's",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _featured_nd_see() {
    return Container(
      height: 40,
      width: double.infinity,
      //color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "Featured",
            style: TextStyle(
              fontSize: 22,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "See all",
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _featureCategory() {
    return Container(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              height: 270,
              //width: 2000,
              //color: Colors.amber,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  _buildSingleFeature(
                    title: "Hotels",
                    Subtitle: "Demo",
                    image: "hotel",
                  ),
                  const SizedBox(width: 40),
                  _buildSingleFeature(
                    title: "Houses",
                    Subtitle: "Demo",
                    image: "house",
                  ),
                  const SizedBox(width: 40),
                  _buildSingleFeature(
                    title: "Merriages",
                    Subtitle: "Demo",
                    image: "merriage",
                  ),
                  const SizedBox(width: 40),
                  _buildSingleFeature(
                    title: "Public Events",
                    Subtitle: "Demo",
                    image: "publicEvent",
                  ),
                  const SizedBox(width: 40),
                  _buildSingleFeature(
                    title: "Restaurants",
                    Subtitle:
                        "A study by Food Ministry, Government of India found that about 20% of food at social events such as weddings goes waste.",
                    image: "Resturant",
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _contentSection() {
    return Container(
      //height: 500,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      //color: const Color.fromARGB(255, 239, 234, 209),
      child: Column(
        children: [
          _categorySection(),
          _featured_nd_see(),
          const SizedBox(height: 20),
          _featureCategory(),
        ],
      ),
    );
  }

  Widget _openDrawer(context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 250, 241, 229),
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
                    Container(
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
                          'Login',
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
                // accountName: Text(
                //   "Zero Hunger",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 21,
                //   ),
                // ),
                // accountEmail: Text(
                //   "zerohunger.mtmk@gmail.com",
                //   style: TextStyle(
                //     color: Color.fromARGB(224, 255, 255, 255),
                //     fontSize: 17,
                //     fontStyle: FontStyle.italic,
                //   ),
                // ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => HomePage(),
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
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(
              //     builder: (ctx) => const Contact(),
              //   ),
              // );
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
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(
              //     builder: (ctx) => const MyProfile(),
              //   ),
              // );
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
              //     builder: (ctx) => const Contact(),
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
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(
              //     builder: (ctx) => const Contact(),
              //   ),
              // );
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _openDrawer(context),
      backgroundColor: const Color.fromARGB(255, 239, 234, 209),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _toBar(context),
              _contentSection(),
            ],
          ),
        ),
      ),
    );
  }
}
