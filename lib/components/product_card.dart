import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:reboot/models/Product.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatefulWidget {
   ProductCard({
    Key key,
    this.width = 160,
    @required this.product,
    @required this.press,
  }) : super(key: key);

  final double width;
  final Product product;
  final GestureTapCallback press;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: 
      GestureDetector(
        onTap: widget.press,
        child: 
        SizedBox (
          width: getProportionateScreenWidth(widget.width),
          child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: .7,
                child: Container(
                  child:
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      widget.product.image,
                      fit: BoxFit.fill,
                    ),
                  )
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.product.title,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "R\$ ${widget.product.price}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          setState(() {
                            widget.product.inCart = !widget.product.inCart;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                          height: getProportionateScreenWidth(28),
                          width: getProportionateScreenWidth(28),
                          decoration: BoxDecoration(
                            color: widget.product.inCart
                              ? Color.fromRGBO(133, 102, 235, 1).withOpacity(.6)
                              // kPrimaryColor.withOpacity(0.15)
                              : kSecondaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/Cart Icon.svg",
                            color: widget.product.inCart
                                ? Colors.white
                                : Colors.black54,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          setState(() {
                            widget.product.isFavourite = !widget.product.isFavourite;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                          height: getProportionateScreenWidth(28),
                          width: getProportionateScreenWidth(28),
                          decoration: BoxDecoration(
                            color: widget.product.isFavourite
                                ? kPrimaryColor.withOpacity(0.15)
                                : kSecondaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: 
                          widget.product.isFavourite
                          ? SvgPicture.asset(
                            "assets/icons/Heart Icon_2.svg",
                            color: widget.product.isFavourite
                                ? Color(0xFFFF4848)
                                : Color(0xFFDBDEE4),
                          )
                          : Icon(
                            LineIcons.heart_o,
                            size: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
