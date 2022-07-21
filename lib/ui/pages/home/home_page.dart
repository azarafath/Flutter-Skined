import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skined/shared/theme.dart';
import 'package:skined/shared/size_config.dart';
import 'package:skined/ui/pages/preview_scan_page.dart';
import 'package:skined/ui/widgets/article_home_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late File image;
  final picker = ImagePicker();

  Future getImage(source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        var state = 1;
        if (source == ImageSource.camera) {
          state = 2;
        } else {
          state = 1;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (contex) => PreviewScan(
              image: image,
              state: state,
            ),
          ),
        );
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      color: blueColor,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/about-us');
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: getProportionateScreenHeight(33),
                      right: getProportionateScreenWidth(25),
                    ),
                    child: Image.asset(
                      'assets/icon_aboutus.png',
                      width: getProportionateScreenWidth(37),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                top: getProportionateScreenHeight(11),
                left: getProportionateScreenWidth(25),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello Friends,',
                        style: latoTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: weightBold,
                          color: whiteColor,
                        ),
                      ),
                      Text(
                        'don’t forget to keep your\nskinhealthy',
                        style: latoTextStyle.copyWith(
                          fontSize: 19,
                          fontWeight: weightBold,
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      'assets/hero_home.png',
                      width: getProportionateScreenWidth(160),
                      height: getProportionateScreenHeight(176),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: getProportionateScreenHeight(492),
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Check your skin section
                  Container(
                    margin: EdgeInsets.only(
                      top: getProportionateScreenHeight(30),
                      left: getProportionateScreenWidth(30),
                      right: getProportionateScreenWidth(30),
                      bottom: getProportionateScreenHeight(42),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Check your skin now!',
                          style: latoTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: weightBold,
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(24),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (() => getImage(ImageSource.camera)),
                              child: Image.asset(
                                'assets/icon_camera.png',
                                width: getProportionateScreenWidth(145),
                                height: getProportionateScreenHeight(130),
                              ),
                            ),
                            GestureDetector(
                              onTap: (() => getImage(ImageSource.gallery)),
                              child: Image.asset(
                                'assets/icon_gallery.png',
                                width: getProportionateScreenWidth(145),
                                height: getProportionateScreenHeight(130),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Line section
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(
                        23,
                      ),
                    ),
                    width: double.infinity,
                    height: 1,
                    color: const Color(0xFFE5E5E5),
                  ),
                  // Articles section
                  Container(
                    margin: EdgeInsets.only(
                      top: getProportionateScreenHeight(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: getProportionateScreenWidth(30),
                          ),
                          child: Text(
                            'Articles',
                            style: latoTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: weightBold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(25),
                        ),
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(
                                width: getProportionateScreenWidth(26),
                              ),
                              ArticleHomeTile(
                                id: 0,
                                image: 'assets/home_jerawat.png',
                              ),
                              ArticleHomeTile(
                                id: 1,
                                image: 'assets/home_kudis.png',
                              ),
                              ArticleHomeTile(
                                id: 2,
                                image: 'assets/home_kutil.png',
                              ),
                              ArticleHomeTile(
                                id: 3,
                                image: 'assets/home_kurap.png',
                              ),
                              ArticleHomeTile(
                                id: 4,
                                image: 'assets/home_dermatitis.png',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
