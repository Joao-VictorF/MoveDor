import 'package:flutter/material.dart';
import 'package:reboot/models/Product.dart';
import 'package:reboot/screens/details/components/body.dart';

import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments = 
      ModalRoute.of(context).settings.arguments;
    return 
    Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(arguments.product),
      body: Body(product: arguments.product),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({ @required this.product });
}