import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skined/shared/size_config.dart';
import 'package:skined/shared/theme.dart';
import 'package:skined/ui/pages/loading_page.dart';

// ignore: must_be_immutable
class PreviewScan extends StatefulWidget {
  PreviewScan({
    Key? key,
    required this.image,
    required this.state,
  }) : super(key: key);
  // add file image
  File? image;
  final int state;

  @override
  State<PreviewScan> createState() => _PreviewScanState();
}

class _PreviewScanState extends State<PreviewScan> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          elevation: 0,
          backgroundColor: whiteColor,
          toolbarHeight: getProportionateScreenHeight(60),
          centerTitle: true,
          flexibleSpace: Container(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(23)),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                'Preview',
                style: latoTextStyle.copyWith(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: weightBold,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: getProportionateScreenHeight(427),
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(58),
                ),
                child: Image.file(
                  widget.image!,
                  fit: BoxFit.cover,
                ),
              ),
              // elevated button
              Container(
                width: double.infinity,
                height: getProportionateScreenHeight(50),
                margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(96),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    primary: blue2Color,
                  ),
                  onPressed: () {
                    // file picker gallery
                    ImagePicker()
                        .pickImage(
                            source: widget.state == 1
                                ? ImageSource.gallery
                                : ImageSource.camera)
                        .then((value) {
                      if (value != null) {
                        // override image
                        setState(() {
                          widget.image = File(value.path);
                        });
                      }
                    });
                  },
                  child: Text(
                    'Change Picture',
                    style: latoTextStyle.copyWith(
                      fontSize: getProportionateScreenWidth(16),
                      fontWeight: weightSemiBold,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(60),
              ),
              Container(
                width: double.infinity,
                height: getProportionateScreenHeight(50),
                margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(16),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    primary: yellowColor,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoadingPage(
                          image: widget.image,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Scan Now',
                    style: latoTextStyle.copyWith(
                      fontSize: getProportionateScreenWidth(16),
                      fontWeight: weightSemiBold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
