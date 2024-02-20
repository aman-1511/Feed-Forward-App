import 'package:flutter/material.dart';
import 'package:food_donation/screen/Widgets/cost_item.dart';
import 'package:food_donation/screen/Widgets/rating_widget.dart';
import 'package:food_donation/screen1/product_screen.dart';
import 'package:food_donation/user_Details/product.dart';

class ResultsWidget extends StatelessWidget {
  final ProductModel product;
  const ResultsWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(productModel: product),
          ),
        );
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: screenSize.width / 3,
                child: Image.network(
                  product.url,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  product.productName,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    SizedBox(
                      width: screenSize.width / 5,
                      child: FittedBox(
                        child: RatingStatWidget(rating: product.rating),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        product.noOfRating.toString(),
                        style: const TextStyle(
                          color: Color(0xff277BC0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: FittedBox(
                  child: CostWidget(
                    color: const Color.fromARGB(255, 214, 35, 22),
                    cost: product.cost,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
