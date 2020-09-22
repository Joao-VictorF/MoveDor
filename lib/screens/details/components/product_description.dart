import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reboot/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductDescription extends StatefulWidget{
  final Product product;
  ProductDescription(this.product);

  _ProductDescriptionState createState()=> _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription>{
  bool showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            widget.product.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                  // width: getProportionateScreenWidth(64),
                  decoration: BoxDecoration(
                   color: Color(0xFFF6F7F9),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )
                  ),
                  child: Row(
                    children: [
                      Text(
                        "${widget.product.rating}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 5),
                      SvgPicture.asset("assets/icons/Star Icon.svg"),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: 
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.product.isFavourite = !widget.product.isFavourite;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                    width: getProportionateScreenWidth(64),
                    decoration: BoxDecoration(
                      color: widget.product.isFavourite
                        ? Color(0xFFFFE6E6)
                        : Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      )
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Heart Icon_2.svg",
                      color: widget.product.isFavourite
                        ? Color(0xFFFF4848)
                        : Color(0xFFDBDEE4), 
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(20)
          ),
          child: Text(
            widget.product.description,
            maxLines: showFullDescription ? 10 : 2,
          ),
        ),
        showFullDescription 
        ? Padding(
            padding: EdgeInsets.only(
              top: getProportionateScreenWidth(30),
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(20)
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF6F7F9),
                borderRadius: BorderRadius.circular(10)
              ),
              child: 
               Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10
                ),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Número de páginas",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.w600)
                          ),
                          Text("130", textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      child: VerticalDivider(
                        color: Colors.black87,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Idioma",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.w600)
                          ),
                          Text("Português", textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            )
          )
        : Container(),
        GestureDetector(
          onTap: () {
            setState(() {
              showFullDescription = !showFullDescription;
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: 10
            ),
            child: Row(
              children: [
                Text(
                  showFullDescription ? "Ver menos" : "Ver mais",
                  style: TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 5),
                Icon(
                  showFullDescription 
                  ? Icons.arrow_drop_up
                  : Icons.arrow_drop_down,
                  size: 20,
                  color: kPrimaryColor,
                )
              ],
            ),
          ),
        )
      ]
    );
  }
}