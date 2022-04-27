import 'package:flutter/material.dart';
// import 'package:stalkers/widgets/bgImage.dart';

class ImageDisplay extends StatefulWidget {
  final String userNameDisplay;
  const ImageDisplay({Key? key, required this.userNameDisplay})
      : super(key: key);

  @override
  State<ImageDisplay> createState() => _ImageDisplayState();
}

class _ImageDisplayState extends State<ImageDisplay> {
  @override
  Widget build(BuildContext context) {
    var instaurl = "http://10.0.2.2:5000/insta/";
    instaurl += widget.userNameDisplay;
    print(instaurl);
    return Scaffold(
      backgroundColor: Color(000000),
      appBar: AppBar(
        title: Text(widget.userNameDisplay),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          // BgImage(),
          Align(
            alignment: Alignment(0.0, 0.0),
            child: SingleChildScrollView(
              child: Container(
                child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/insta_def_pic.png',
                    image: instaurl),
              ),
            ),
          )
        ],
      )),
    );
  }
}
