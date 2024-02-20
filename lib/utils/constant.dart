import 'package:flutter/material.dart';
import 'package:food_donation/Horizantal_Category/About.dart';
import 'package:food_donation/Horizantal_Category/chat.dart';
import 'package:food_donation/Horizantal_Category/money_donation.dart';
import 'package:food_donation/Horizantal_Category/ngo.dart';
import 'package:food_donation/Horizantal_Category/profile.dart';
import 'package:food_donation/layout/screen_layout.dart';
import 'package:food_donation/screen/Widgets/simple_product.dart';
import 'package:food_donation/screen1/account_screen.dart';
import 'package:food_donation/screen1/cart_screen.dart';
import 'package:food_donation/screen1/home_screen.dart';
import 'package:food_donation/screen1/more_screen.dart';
import 'package:food_donation/screen1/sell_screen.dart';
import 'package:food_donation/user_Details/product.dart';
import 'package:location/location.dart';

import '../Horizantal_Category/location.dart';
import '../layout/screen_layout.dart';

const List<Widget> screens = [
  HomeScreen(),
  AccountScreen(),
  CartScreen(),
  MoreScreen(),
];

const List<String> categoriesList = [
  "Home",
  "Donation",
  "Donation",
  "Chat Us",
  "Location",
  "NGO's",
  "Profile",
  "About Us",
  "More"
];
List<Icon> iconList = [
  const Icon(Icons.home, color: Colors.white, size: 40.0),
  const Icon(Icons.food_bank_rounded, color: Colors.white, size: 35.0),
  const Icon(Icons.currency_rupee_sharp, color: Colors.white, size: 35.0),
  const Icon(Icons.chat_bubble, color: Colors.white, size: 28.0),
  const Icon(Icons.location_on, color: Colors.white, size: 30.0),
  const Icon(Icons.home_work_rounded, color: Colors.white, size: 30.0),
  const Icon(Icons.person_2, color: Colors.white, size: 38.0),
  const Icon(Icons.info, color: Colors.white, size: 30.0),
  const Icon(Icons.swipe_right_rounded, color: Colors.white, size: 25.0),
];
const List<String> categoryLogos = [
  "images/home.png",
  "images/food.png",
  "images/money.png",
  "images/chat.png",
  "images/map.png",
  "images/ngo.png",
  "images/profile.png",
  "images/logo2.png",
  "images/more.png"
];

List<String> smallAds = [
  "https://r1imghtlak.mmtcdn.com/082f1ae6330211eb9c050242ac110004.jpg?&output-quality=75&downsize=583:388&output-format=jpg%22",
  "https://b.zmtcdn.com/data/pictures/4/2004/ab413ceb3dc0587c18cb1ba6893b7917_featured_v2.jpg",
  "https://i.pinimg.com/originals/f3/39/ac/f339ac13e4b5565b075f11f3681071ee.jpg",
  "https://cdn0.weddingwire.in/vendor/4395/3_2/960/jpg/marriage-garden-madhuvan-marriage-garden-event-space-3_15_364395-161536520227548.jpeg",
];

const List<String> adItemNames = [
  "Hotels",
  "Restaurants",
  "Public Events",
  "Marriages",
];

List<Widget> testChildren = [
  SimpleProductWidget(
    productModel: ProductModel(
        url:
            "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60",
        productName: "Food",
        cost: 999,
        discount: 0,
        uid: "eioejfbkn",
        sellerName: "Mayank",
        sellerUid: "123456",
        rating: 1,
        noOfRating: 1),
  ),
  SimpleProductWidget(
    productModel: ProductModel(
        url:
            "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60",
        productName: "Food",
        cost: 999,
        discount: 0,
        uid: "eioejfbkn",
        sellerName: "Mayank",
        sellerUid: "123456",
        rating: 1,
        noOfRating: 1),
  ),
  SimpleProductWidget(
    productModel: ProductModel(
        url:
            "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60",
        productName: "Food",
        cost: 999,
        discount: 0,
        uid: "eioejfbkn",
        sellerName: "Mayank",
        sellerUid: "123456",
        rating: 1,
        noOfRating: 1),
  ),
  SimpleProductWidget(
    productModel: ProductModel(
        url:
            "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60",
        productName: "Food",
        cost: 999,
        discount: 0,
        uid: "eioejfbkn",
        sellerName: "Mayank",
        sellerUid: "123456",
        rating: 1,
        noOfRating: 1),
  ),
  SimpleProductWidget(
    productModel: ProductModel(
        url:
            "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60",
        productName: "Food",
        cost: 999,
        discount: 0,
        uid: "eioejfbkn",
        sellerName: "Mayank",
        sellerUid: "123456",
        rating: 1,
        noOfRating: 1),
  )
];

List<Widget> productsList = [
  const ScreenLayout(),
  const SellScreen(),
  const Payment(),
  ChatScreen(),
  const MapScreen(),
  const NGO(),
  const MyProfile(),
  const About(),
  const MoreScreen(),
];

List<String> keysOfRating = [
  "Very bad",
  "Poor",
  "Average",
  "Good",
  "Excellent"
];
