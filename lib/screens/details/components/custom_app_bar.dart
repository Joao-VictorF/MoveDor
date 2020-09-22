import 'package:flutter/material.dart';
import 'package:reboot/components/rounded_icon_btn.dart';
import 'package:reboot/models/Product.dart';

import '../../../size_config.dart';

class CustomAppBar extends PreferredSize {
  final Product product;
  CustomAppBar(this.product);
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedIconBtn(
              iconData: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black87),
              showShadow: true,
              press: () => Navigator.pop(context)
            ),
            RoundedIconBtn(
              iconData: Icon(Icons.share, size: 18, color: Colors.black87),
              showShadow: true,
              press: () => Navigator.pop(context)
            ),
          ]
        ),
      ),
    );
  }  
}