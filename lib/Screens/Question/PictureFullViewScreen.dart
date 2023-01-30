import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:webpatente/base/base_stateful_widget.dart';
import 'package:webpatente/resources/color_resources.dart';
import 'package:webpatente/resources/image_resources.dart';

import '../../Widgets/common_appbar.dart';

class PictureFullViewScreen extends StatefulWidget {
  final String? image;

  const PictureFullViewScreen({
    super.key,
    this.image,
  });

  @override
  State<PictureFullViewScreen> createState() => _PictureFullViewScreenState();
}

class _PictureFullViewScreenState extends BaseStatefulWidgetState<PictureFullViewScreen> {
  int isIndex = 0;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    // TODO: implement buildAppBar
    return CommonAppBar(
      backIcon: icArrowLeft,
      backIconHeight: 45.h,
      backIconWidth: 45.w,
      title: '',
      backgroundColor: colorBackground,
    );
  }

  @override
  // TODO: implement scaffoldBgColor
  Color? get scaffoldBgColor => colorBlack.withOpacity(0.7);

  @override
  Widget buildBody(BuildContext context) {
    return Stack(
      children: [
        PhotoViewGallery.builder(
          backgroundDecoration: const BoxDecoration(color: colorBackground),
          scrollPhysics: const BouncingScrollPhysics(),

          onPageChanged: (changeIndex) {
            setState(() {
              isIndex = changeIndex;
              setState(() {});
            });
          },
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 1,
              imageProvider: NetworkImage(
                widget.image!,
              ),
              // const AssetImage(icDummy),
              initialScale: PhotoViewComputedScale.contained * 0.8,
              // heroAttributes: PhotoViewHeroAttributes(tag: galleryItems[index].id),
            );
          },
          itemCount: 1,
          loadingBuilder: (context, event) => const Center(
            child: SizedBox(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(value: 0
                  // event == null
                  //     ? 0
                  //     : event.cumulativeBytesLoaded / event.expectedTotalBytes,
                  ),
            ),
          ),
          // backgroundDecoration: widget.backgroundDecoration,
          // pageController: widget.pageController,
          // onPageChanged: onPageChanged,
        ),
        // Positioned(
        //   bottom: 20,
        //   child: Container(
        //     width: screenSize.width,
        //     height: 30,
        //     alignment: AlignmentDirectional.center,
        //     child: ListView.builder(
        //         itemCount: 2,
        //         shrinkWrap: true,
        //         scrollDirection: Axis.horizontal,
        //         itemBuilder: (context, index) {
        //           return Padding(
        //             padding: EdgeInsets.symmetric(horizontal: 2.w),
        //             child: Container(
        //               height: 12.h,
        //               width: 12.w,
        //               decoration: BoxDecoration(
        //                 color: isIndex == index ? colorPrimary : colorWhite,
        //                 shape: BoxShape.circle,
        //               ),
        //             ),
        //           );
        //         }),
        //   ),
        // ),
      ],
    );
  }
}
