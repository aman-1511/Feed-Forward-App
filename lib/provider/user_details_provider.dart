import 'package:flutter/material.dart';
import 'package:food_donation/resourses/cloudfirestore.dart';
import 'package:food_donation/user_Details/user_details.dart';

class UserDetailsProvider with ChangeNotifier {
  UserDetailsModel userDetails;

  UserDetailsProvider()
      : userDetails = UserDetailsModel(name: "Mayank", phone: "8418885752");

  Future getData() async {
    userDetails = await CloudFirestoreClass().getNameAndAddress();
    notifyListeners();
  }
}
