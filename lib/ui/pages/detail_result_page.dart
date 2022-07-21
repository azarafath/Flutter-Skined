import 'dart:io';
import 'package:flutter/material.dart';
import 'package:skined/shared/size_config.dart';
import 'package:skined/shared/theme.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

class DetailResultPage extends StatefulWidget {
  const DetailResultPage(
      {Key? key,
      this.image,
      required this.sDetail,
      required this.lDetail,
      required this.penyakit,
      required this.tips,
      required this.medicine})
      : super(key: key);
  final File? image;
  final String sDetail;
  final String lDetail;
  final String penyakit;
  final String tips;
  final List medicine;

  @override
  _DetailResultPageState createState() => _DetailResultPageState();
}

class _DetailResultPageState extends State<DetailResultPage> {
  bool lText = false;
  bool isTips = true;
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    Widget tipsWidget() {
      return Container(
        height: getProportionateScreenHeight(210),
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(27),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: getProportionateScreenWidth(2),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: VsScrollbar(
          controller: _scrollController,
          showTrackOnHover: true, // default false
          isAlwaysShown: true,
          style: VsScrollbarStyle(
            color: Color(0xff9D9F9F),
            hoverThickness: 1,
            radius: Radius.circular(5),
            thickness: 7,
          ),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.tips,
                style: latoTextStyle.copyWith(
                  fontSize: getProportionateScreenWidth(14),
                  fontWeight: weightMedium,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ),
      );
    }

    Widget medicineWidget() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(25),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(92),
                  width: getProportionateScreenWidth(142),
                  child: Image.asset(widget.medicine[0]),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(92),
                  width: getProportionateScreenWidth(142),
                  child: Image.asset(widget.medicine[1]),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(17),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(92),
                  width: getProportionateScreenWidth(142),
                  child: Image.asset(widget.medicine[2]),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(92),
                  width: getProportionateScreenWidth(142),
                  child: Image.asset(widget.medicine[3]),
                )
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
          ],
        ),
      );
    }

    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Container(
          width: double.infinity,
          height: getProportionateScreenHeight(181),
          margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(31),
            vertical: getProportionateScreenHeight(17),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // border color
            border: Border.all(
              color: blueColor,
              width: getProportionateScreenWidth(3),
            ),
            image: DecorationImage(
              // image from image Xfile
              image: Image.file(widget.image!).image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Anda Mengalami Penyakit ',
                  style: latoTextStyle.copyWith(
                      fontSize: getProportionateScreenWidth(20),
                      fontWeight: weightBold),
                ),
                Text(
                  widget.penyakit,
                  style: latoTextStyle.copyWith(
                    decoration: TextDecoration.underline,
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: weightBold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            Text(
              'Butuh Penanganan !',
              style: latoTextStyle.copyWith(
                fontSize: getProportionateScreenWidth(20),
                fontWeight: weightBold,
                color: yellowColor,
                shadows: [
                  Shadow(
                      // bottomLeft
                      offset: Offset(-1.5, -1.5),
                      color: Colors.black),
                  Shadow(
                      // bottomRight
                      offset: Offset(1.5, -1.5),
                      color: Colors.black),
                  Shadow(
                      // topRight
                      offset: Offset(1.5, 1.5),
                      color: Colors.black),
                  Shadow(
                      // topLeft
                      offset: Offset(-1.5, 1.5),
                      color: Colors.black),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            // line
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(36),
              ),
              width: double.infinity,
              height: getProportionateScreenHeight(1),
              color: Colors.black,
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(22),
              horizontal: getProportionateScreenWidth(29)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.penyakit.toUpperCase(),
                style: latoTextStyle.copyWith(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: weightBold,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              lText
                  ? GestureDetector(
                      onDoubleTap: () {
                        setState(() {
                          lText = false;
                        });
                      },
                      child: Text(
                        widget.lDetail,
                        style: latoTextStyle.copyWith(
                          fontSize: getProportionateScreenWidth(13),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          lText = !lText;
                        });
                      },
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.sDetail + ' ',
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
                      ),
                    ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Row(
                // make double button
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isTips = true;
                      });
                    },
                    child: Container(
                      width: getProportionateScreenWidth(150),
                      height: getProportionateScreenHeight(50),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: getProportionateScreenWidth(2),
                        ),
                        color: isTips ? yellowColor : whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Tips',
                          style: latoTextStyle.copyWith(
                            fontSize: getProportionateScreenWidth(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isTips = false;
                      });
                    },
                    child: Container(
                      width: getProportionateScreenWidth(150),
                      height: getProportionateScreenHeight(50),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: getProportionateScreenWidth(2),
                        ),
                        color: isTips ? whiteColor : yellowColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Medicine',
                          style: latoTextStyle.copyWith(
                            fontSize: getProportionateScreenWidth(20),
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        isTips ? tipsWidget() : medicineWidget(),
        SizedBox(
          height: getProportionateScreenHeight(12),
        )
      ],
    );
  }
}
