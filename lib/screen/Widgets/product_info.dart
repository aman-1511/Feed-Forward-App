import 'package:flutter/material.dart';
import 'package:food_donation/screen/Widgets/cost_item.dart';

class ProductInformationWidget extends StatelessWidget {
  final String productName;
  final double cost;
  final String sellerName;
  const ProductInformationWidget({
    Key? key,
    required this.productName,
    required this.cost,
    required this.sellerName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    SizedBox spaceThingy = const SizedBox(
      height: 7,
    );
    return SizedBox(
      width: screenSize.width / 2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                productName,
                maxLines: 2,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: 0.9,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          //spaceThingy,
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 30),
              child: CostWidget(color: Colors.black, cost: cost),
            ),
          ),
          //spaceThingy,
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 30),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Sold by ",
                      style: TextStyle(color: Colors.grey[700], fontSize: 14),
                    ),
                    TextSpan(
                      text: sellerName,
                      style: const TextStyle(
                          color: Color(0xff277BC0), fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
