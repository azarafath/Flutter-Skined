import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skined/provider/article_page_provider.dart';
import 'package:skined/shared/size_config.dart';
import 'package:skined/shared/theme.dart';

class ArticleTileWidget extends StatelessWidget {
  const ArticleTileWidget(
      {Key? key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.id})
      : super(key: key);
  final int id;
  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    ArticlePageProvider articlePageProvider =
        Provider.of<ArticlePageProvider>(context);
    return GestureDetector(
      onTap: () {
        articlePageProvider.currentIndex = id;
      },
      child: Hero(
        tag: id,
        child: Container(
          width: double.infinity,
          height: getProportionateScreenHeight(115),
          margin: EdgeInsets.only(
              top: getProportionateScreenHeight(9),
              left: getProportionateScreenWidth(24),
              right: getProportionateScreenWidth(24),
              bottom: getProportionateScreenHeight(9)),
          decoration: BoxDecoration(
            color: whiteColor,
            // drop shadow
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF000000).withOpacity(0.25),
                offset: const Offset(4, 4),
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                width: getProportionateScreenWidth(115),
                height: getProportionateScreenWidth(115),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(8),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: latoTextStyle.copyWith(
                          fontSize: 20, fontWeight: weightBold),
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: subTitle,
                            style: latoTextStyle.copyWith(
                              fontSize: getProportionateScreenWidth(12.5),
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: '..more',
                            style: latoTextStyle.copyWith(
                                fontSize: getProportionateScreenWidth(12.5),
                                color: blue2Color),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(6),
              )
            ],
          ),
        ),
      ),
    );
  }
}
