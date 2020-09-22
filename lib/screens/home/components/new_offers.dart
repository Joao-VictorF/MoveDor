import 'package:flutter/material.dart';
import 'package:reboot/screens/details/details_screen.dart';

import '../../../size_config.dart';
import 'section_title.dart';

import 'package:reboot/models/Product.dart';
import 'package:reboot/components/product_card.dart';

class NewOffers extends StatelessWidget {
  const NewOffers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Novidades",
            press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                (index) {
                  return ProductCard(
                    product: demoProducts[index],
                    press: () => Navigator.pushNamed(
                      context, DetailsScreen.routeName, 
                      arguments: ProductDetailsArguments(
                        product: demoProducts[index]))
                  );
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}
