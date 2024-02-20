// ignore: file_names
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food_donation/layout/screen_layout.dart';
import 'package:food_donation/screen/Team_Members/kashish.dart';
import 'package:food_donation/screen/Team_Members/mayank.dart';
import 'package:food_donation/screen/Team_Members/milind.dart';
import 'package:food_donation/screen/Team_Members/tanush.dart';
import 'package:food_donation/screen1/home_screen.dart';

import '../layout/screen_layout.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  // late final Function member;

  List textList = [
    {
      "id": 1,
      "text_path":
          'The Food Donation Project System application is designed in such a way that the users have two options to select. If the user looking to donate food, login using username and password then add the below information in the application: Name of the food item and the excess quantity. Location of the user using GPS'
    },
    {
      "id": 2,
      "text_path":
          'Feed Forward is an innovative app that aims to tackle the problem of food waste and hunger by connecting food businesses with local food banks and charities. By donating surplus food, businesses can help reduce food waste and address food insecurity in their communities. '
    },
    {
      "id": 3,
      "text_path":
          'The app also promotes public health by reducing the risk of food poisoning caused by consuming expired or improperly stored food. Join us in our mission to create a sustainable solution to this global problems.'
    },
    {
      "id": 4,
      "text_path":
          'The app also provides an opportunity for individuals and organizations to contribute to a larger cause of reducing food waste and addressing food insecurity, creating a sense of community and social responsibility.'
    },
    {
      "id": 5,
      "text_path":
          "Feed Forward also provides a valuable resource for food banks and charities, who can use the app to easily track incoming donations and manage their inventory of food items."
    },
  ];

  final CarouselController carouselController = CarouselController();
  int currIndex = 0;

  Widget _slidingBanner() {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            print(currIndex);
          },
          child: CarouselSlider(
            items: textList
                .map(
                  (item) => Text(
                    item['text_path'],
                    //textDirection: TextDirection.ltr,
                    //textWidthBasis: ,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
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
            children: textList.asMap().entries.map((entry) {
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
                          ? const Color.fromARGB(255, 86, 90, 93)
                          : const Color.fromARGB(255, 171, 162, 162)),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _teamMember({
    required String name,
    required String pos,
    required final Function member,
  }) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: const Color(0xffFFFAE7),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(120, 0, 0, 0),
            blurRadius: 25,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            maxRadius: 40,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("images/man.png"),
          ),
          SizedBox(
            height: 80,
            width: 200,
            //color: Colors.amberAccent,
            child: ListTile(
              title: Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                pos,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => member(),
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 25,
            ),
          )
        ],
      ),
    );
  }

  Widget _midLine() {
    return Container(
      //height: 50,
      //color: Colors.red,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: const [
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: Color.fromARGB(255, 8, 8, 8),
            ),
          ),
          Text(
            "About Team Member's",
            style: TextStyle(
              color: Color.fromARGB(255, 15, 15, 15),
              fontSize: 14,
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: Color.fromARGB(255, 12, 12, 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dynamicAbout() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: const Color(0xffFFFAE7),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(120, 0, 0, 0),
            blurRadius: 25,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: _slidingBanner(),
    );
  }

  Widget _topSection() {
    return Container(
      width: double.infinity,
      height: 350,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/logo2.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            colors: [
              Color(0xffFFB200),
              // Color(0xffFEB139),
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
          "About",
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _topSection(),
            const SizedBox(height: 50),
            _dynamicAbout(),
            const SizedBox(height: 30),
            _midLine(),
            const SizedBox(height: 20),
            _teamMember(
              name: "Mayank Kumar Shah",
              pos: "21bds037",
              member: () => const Mayank(),
            ),
            const SizedBox(height: 20),
            _teamMember(
              name: "Milind Murmu",
              pos: "21bds038",
              member: () => const Milind(),
            ),
            const SizedBox(height: 20),
            _teamMember(
              name: "Kashish Raju Lonpande",
              pos: "21bds026",
              member: () => const Kashish(),
            ),
            const SizedBox(height: 20),
            _teamMember(
              name: "Korgaokar Tanush Dharmesh",
              pos: "21bds030",
              member: () => const Tanush(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
