// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/provider/user_details_provider.dart';
import 'package:food_donation/resourses/cloudfirestore.dart';
import 'package:food_donation/screen/Widgets/cost_item.dart';
import 'package:food_donation/screen/Widgets/custom_main.dart';
import 'package:food_donation/screen/Widgets/custome_simple_rounded.dart';
import 'package:food_donation/screen/Widgets/rating_widget.dart';
import 'package:food_donation/screen/Widgets/review_dialog.dart';
import 'package:food_donation/screen/Widgets/review_widgit.dart';
import 'package:food_donation/screen/Widgets/searchbar.dart';
import 'package:food_donation/screen/Widgets/user_detail.dart';
import 'package:food_donation/user_Details/product.dart';
import 'package:food_donation/user_Details/review_model.dart';
import 'package:food_donation/utils/utils.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductScreen({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Expanded spaceThingy = Expanded(child: Container());
  //SizedBox spaceThingy = const SizedBox(height: 20);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFF4CF),
        appBar: SearchBarWidget(
          isReadOnly: true,
          hasBackButton: true,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenSize.height - (170 + (170)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 80 / 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        widget.productModel.sellerName,
                                        style: const TextStyle(
                                            color: Color(0xff277BC0),
                                            fontSize: 16),
                                      ),
                                    ),
                                    Text(widget.productModel.productName),
                                  ],
                                ),
                                RatingStatWidget(
                                  rating: widget.productModel.rating,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              //color: Colors.amber,
                              height: screenSize.height / 4,
                              constraints: BoxConstraints(
                                  maxHeight: screenSize.height / 3),
                              child: Image.network(widget.productModel.url),
                            ),
                          ),
                          spaceThingy,
                          CostWidget(
                              color: Colors.black,
                              cost: widget.productModel.cost),
                          spaceThingy,
                          CustomMainButton(
                            color: Colors.orange,
                            isLoading: false,
                            onPressed: () async {
                              await CloudFirestoreClass().addProductToOrders(
                                  model: widget.productModel,
                                  userDetails: Provider.of<UserDetailsProvider>(
                                          context,
                                          listen: false)
                                      .userDetails);
                              Utils().showSnackBar(
                                  context: context, content: "Done");
                            },
                            //onPressed: () {},
                            child: const Text(
                              "Claim Now",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          spaceThingy,
                          CustomMainButton(
                            color: Colors.yellow,
                            isLoading: false,
                            onPressed: () async {
                              await CloudFirestoreClass().addProductToCart(
                                  productModel: widget.productModel);
                              Utils().showSnackBar(
                                  context: context,
                                  content: "Sucessfully Added.");
                            },
                            //onPressed: () {},
                            child: const Text(
                              "Add to Request List",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          spaceThingy,
                          CustomSimpleRoundedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => ReviewDialog(
                                          productUid: widget.productModel.uid,
                                        ));
                              },
                              // onPressed: () {},
                              text: "Drop Review for this items"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height,
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("products")
                            .doc(widget.productModel.uid)
                            .collection("reviews")
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container();
                          } else {
                            return ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  ReviewModel model =
                                      ReviewModel.getModelFromJson(
                                          json: snapshot.data!.docs[index]
                                              .data());
                                  return ReviewWidget(review: model);
                                });
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            const UserDetailsBar(
              offset: 0,
            ),
          ],
        ),
      ),
    );
  }
}
