import 'package:flutter/material.dart';
import 'package:food_donation/resourses/cloudfirestore.dart';
import 'package:food_donation/screen/Widgets/custome_simple_rounded.dart';
import 'package:food_donation/screen/Widgets/product_info.dart';
import 'package:food_donation/screen/Widgets/square_custom.dart';
import 'package:food_donation/screen1/product_screen.dart';
import 'package:food_donation/user_Details/product.dart';
import 'package:food_donation/utils/utils.dart';

class CartItemWidget extends StatelessWidget {
  final ProductModel product;
  const CartItemWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(25),
      // height: screenSize.height / 2,
      // width: screenSize.width,
      height: 335,
      width: 450,
      decoration: const BoxDecoration(
        // color: Colors.blue,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),

      // child: Column(
      //   children: [
      //     Expanded(
      //       flex: 1,
      //       child: Row(
      //         children: [
      //           SizedBox(
      //             width: screenSize.width / 3,
      //             child: Align(
      //               alignment: Alignment.topCenter,
      //               child: Center(
      //                 child: Image.network(
      //                   "https://m.media-amazon.com/images/I/11iTpTDy6TL._SS70_.png",
      //                 ),
      //               ),
      //             ),
      //           ),
      //           const ProductInformationWidget(
      //             productName: "something clean stuff pink in color large size",
      //             cost: 780,
      //             sellerName: "Mayank",
      //           ),
      //         ],
      //       ),
      //     ),
      //     Expanded(
      //       flex: 1,
      //       child: Row(
      //         children: [
      //           CustomSquareButton(
      //             onPressed: () {},
      //             color: Colors.grey[500]!,
      //             dimension: 40,
      //             child: const Icon(Icons.remove),
      //           ),
      //           CustomSquareButton(
      //             onPressed: () {},
      //             color: Colors.white,
      //             dimension: 40,
      //             child: const Text(
      //               "0",
      //               style: TextStyle(
      //                 color: Colors.cyan,
      //               ),
      //             ),
      //           ),
      //           CustomSquareButton(
      //             onPressed: () {},
      //             color: Colors.grey[500]!,
      //             dimension: 40,
      //             child: const Icon(Icons.add),
      //           )
      //         ],
      //         // color: Colors.red,
      //       ),
      //     ),
      //     Expanded(
      //       flex: 1,
      //       child: Padding(
      //         padding: const EdgeInsets.only(top: 5),
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Row(
      //               children: [
      //                 CustomSimpleRoundedButton(
      //                   text: "Delete",
      //                   onPressed: () {},
      //                 ),
      //                 const SizedBox(width: 8),
      //                 CustomSimpleRoundedButton(
      //                   text: "Save for later",
      //                   onPressed: () {},
      //                 ),
      //               ],
      //             ),
      //             const Padding(
      //               padding: EdgeInsets.only(top: 5),
      //               child: Align(
      //                 alignment: Alignment.centerLeft,
      //                 child: Text(
      //                   "See more like this",
      //                   style: TextStyle(color: Colors.cyan, fontSize: 15),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductScreen(productModel: product)),
                );
              },
              // onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    //width: screenSize.width / 3,
                    width: 450 / 3,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Center(
                        child: Image.network(product.url),
                      ),
                    ),
                  ),
                  ProductInformationWidget(
                    productName: product.productName,
                    cost: product.cost,
                    sellerName: product.sellerName,
                    // productName:
                    //     "something clean stuff pink in color large size",
                    // cost: 780,
                    // sellerName: "Mayank",
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                CustomSquareButton(
                  onPressed: () {},
                  color: Colors.grey[500]!,
                  dimension: 35,
                  child: const Icon(Icons.remove),
                ),
                CustomSquareButton(
                  onPressed: () {},
                  color: Colors.white,
                  dimension: 35,
                  child: const Text(
                    "0",
                    style: TextStyle(
                      color: Colors.cyan,
                    ),
                  ),
                ),
                CustomSquareButton(
                    onPressed: () async {
                      await CloudFirestoreClass().addProductToCart(
                        productModel: ProductModel(
                            url: product.url,
                            productName: product.productName,
                            cost: product.cost,
                            discount: product.discount,
                            uid: Utils().getUid(),
                            sellerName: product.sellerName,
                            sellerUid: product.sellerUid,
                            rating: product.rating,
                            noOfRating: product.noOfRating),
                      );
                    },
                    //onPressed: () {},
                    color: Colors.grey[500]!,
                    dimension: 35,
                    child: const Icon(Icons.add)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      CustomSimpleRoundedButton(
                          onPressed: () async {
                            CloudFirestoreClass()
                                .deleteProductFromCart(uid: product.uid);
                          },
                          //onPressed: () {},
                          text: "Delete"),
                      const SizedBox(
                        width: 5,
                      ),
                      CustomSimpleRoundedButton(
                        onPressed: () {},
                        text: "Save for later",
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "See more like this",
                        style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
