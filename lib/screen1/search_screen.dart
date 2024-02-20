import 'package:flutter/material.dart';
import 'package:food_donation/screen/Widgets/searchbar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF4CF),
      appBar: SearchBarWidget(
        isReadOnly: false,
        hasBackButton: true,
      ),
    );
  }
}
