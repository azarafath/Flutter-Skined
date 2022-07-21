import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skined/provider/article_page_provider.dart';
import 'package:skined/shared/size_config.dart';
import 'package:skined/shared/theme.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

class DetailArticle extends StatelessWidget {
  const DetailArticle(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.image})
      : super(key: key);
  final String title;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    ArticlePageProvider articlePageProvider =
        Provider.of<ArticlePageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        toolbarHeight: getProportionateScreenHeight(60),
        centerTitle: true,
        flexibleSpace: Container(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(20)),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: blueColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Text(
                  title,
                  style: latoTextStyle.copyWith(
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: weightBold,
                    color: whiteColor,
                  ),
                ),
              ),
              // back arrow left position
              Positioned(
                left: getProportionateScreenWidth(20),
                top: getProportionateScreenHeight(24),
                child: GestureDetector(
                  onTap: (() => articlePageProvider.currentIndex = 5),
                  child: const Icon(Icons.arrow_back_sharp,
                      size: 25, color: whiteColor),
                ),
              ),
            ],
          ),
        ),
      ),
      body: VsScrollbar(
        controller: _scrollController,
        showTrackOnHover: true, // default false
        isAlwaysShown: true,
        style: VsScrollbarStyle(
          color: Color(0xff9D9F9F),
          hoverThickness: 1,
          radius: Radius.circular(5),
          thickness: 7,
        ),

        child: ListView(
          physics: BouncingScrollPhysics(),
          controller: _scrollController,
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(16),
            vertical: getProportionateScreenHeight(30),
          ),
          children: [
            Hero(
              tag: articlePageProvider.currentIndex,
              child: Container(
                margin: EdgeInsets.only(
                  bottom: getProportionateScreenHeight(23),
                ),
                height: getProportionateScreenHeight(191),
                width: getProportionateScreenWidth(338),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              title,
              style: latoTextStyle.copyWith(
                fontSize: getProportionateScreenWidth(24),
                fontWeight: weightMedium,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(14),
            ),
            Text(
              subTitle,
              style: latoTextStyle.copyWith(
                fontSize: getProportionateScreenWidth(16),
                fontWeight: weightMedium,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
