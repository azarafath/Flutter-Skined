import 'package:flutter/material.dart';

import 'package:skined/shared/theme.dart';
import 'package:skined/shared/size_config.dart';

class ProfileInfoWidget extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  ProfileInfoWidget({
    Key? key,
    required this.name,
    required this.info,
    required this.image,
  }) : super(key: key);
  final String image;
  final String name;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: getProportionateScreenHeight(55),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: getProportionateScreenHeight(19),
            ),
            height: getProportionateScreenHeight(144),
            width: getProportionateScreenWidth(144),
            decoration: BoxDecoration(
              color: Color(0xffD9D9D9),
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            ),
          ),
          Text(
            name,
            style: latoTextStyle.copyWith(
              fontSize: 20,
              fontWeight: weightBold,
            ),
          ),
          Text(
            info,
            style: latoTextStyle.copyWith(
              fontSize: 10,
              fontWeight: weightBold,
            ),
          ),
        ],
      ),
    );
  }
}
