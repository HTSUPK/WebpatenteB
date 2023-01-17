
import 'package:flutter/material.dart';

import '../resources/color_resources.dart';
import '../resources/strings.dart';

class ProfileImageWidget extends StatelessWidget {
  final double height, width;
  const ProfileImageWidget(
      {Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
   /* return CachedNetworkImage(
      imageUrl: userProfile,
      imageBuilder: (context, imageProvider) => Material(
        elevation: 10.0,
        shadowColor: Colors.black.withOpacity(0.4),
        color: colorWhite,
        type: MaterialType.circle,
        child: Container(
          padding: EdgeInsets.all(3),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
            ),
          ),
        ),
      ),
      placeholder: (context, url) => ShimmerViewWidget(
          height: height, width: width, boxShape: BoxShape.circle),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );*/
  }
}
