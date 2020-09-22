import 'package:flutter/material.dart';
import 'package:reboot/components/default_button.dart';
import 'package:reboot/components/rounded_icon_btn.dart';
import 'package:reboot/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'top_rounded_container.dart';

class ProductPricing extends StatefulWidget{
  final Product product;
  ProductPricing(this.product);

  _ProductPricingState createState()=> _ProductPricingState();
}

class _ProductPricingState extends State<ProductPricing>{
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return 
    TopRoundedContainer(
      color: Color(0xFFF6F7F9),
      child: 
      Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(25)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: 
                  Text(
                    "R\$ ${(widget.product.price * amount).toStringAsFixed(2)}",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 25
                    ),
                  ), 
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RoundedIconBtn(
                        iconData: Icon(Icons.remove),
                        press: () {
                          setState(() {
                            amount == 1 ? amount = 1 : amount = amount - 1;
                          });
                          print(amount.toString());
                        }
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)
                        ),
                        child: 
                        Text(
                          amount.toString(),
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 25
                          ),
                        ),
                      ),
                      RoundedIconBtn(
                        iconData: Icon(Icons.add),
                        press: () {
                          setState(() {
                            amount = amount + 1;
                          });
                          print(amount.toString());
                        }
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          TopRoundedContainer(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(25),
                right: getProportionateScreenWidth(25),
                top: getProportionateScreenWidth(15),
                bottom: getProportionateScreenWidth(30),
              ),
              child: DefaultButton(
                text: "Adicionar ao carrinho",
                press: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}