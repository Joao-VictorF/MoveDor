import 'package:flutter/material.dart';
import 'package:reboot/components/default_button.dart';
import 'package:reboot/models/Product.dart';
import 'product_description.dart';
import 'product_pricing.dart';
import 'top_rounded_container.dart';
import 'package:reboot/size_config.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: getProportionateScreenWidth(238),
            height: getProportionateScreenWidth(238),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(product.image, scale: 0.6,),
            )
          ),
          Row(children: [],),
          TopRoundedContainer(
            color: Colors.white, 
            child: 
            Column(
              children: [
                ProductDescription(
                  product: product,
                  pressOnSeeMore: () {}
                ),
                ProductPricing(product),
              ],
            )
          )
        ],
      ),
    );
  }
}