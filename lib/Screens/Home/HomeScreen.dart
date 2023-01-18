import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../Widgets/card_widget.dart';
import '../../Widgets/text_widget.dart';
import '../../base/base_stateful_widget.dart';
import '../../resources/color_resources.dart';
import '../../resources/image_resources.dart';
import '../../resources/strings.dart';
import '../Profile/ProfileScreen.dart';
import '../Statistics/StatisticsScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseStatefulWidgetState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        color: colorBackground,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 347.h,
                width: screenSize.width,
                color: colorPrimary,
                child: Column(
                  children: [
                    heightBox(58.h),
                    Padding(
                      padding: EdgeInsets.only(left: 24.w, right: 5.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: colorWhite,
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg",
                              ),
                            ),
                          ),
                          widthBox(15.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Marcus Levin",
                                fontSize: 26,
                                color: colorWhite,
                                fontFamily: strFontName,
                                fontWeight: FontWeight.w700,
                              ),
                              TextWidget(
                                text: "Profile",
                                fontSize: 16,
                                color: colorWhite,
                                fontFamily: strFontName,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 80.h,
                            width: 80.w,
                            child: Image.asset(
                              icVip,
                            ),
                          ),
                        ],
                      ),
                    ),
                    heightBox(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CardWidget(
                          height: 150.h,
                          width: 144.w,
                          imageName: icQuestion,
                          imageHeight: 73.h,
                          imageWidth: 73.w,
                          textName: "Questions",
                        ),
                        CardWidget(
                          height: 150.h,
                          width: 144.w,
                          imageName: icQuiz,
                          imageHeight: 73.h,
                          imageWidth: 73.w,
                          textName: "Quiz",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              heightBox(40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CardWidget(
                      height: 150.h,
                      width: 144.w,
                      imageName: icStatistic,
                      imageHeight: 73.h,
                      imageWidth: 73.w,
                      textName: "Statistics",
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StatisticsScreen(),
                          ))),
                  CardWidget(
                    height: 150.h,
                    width: 144.w,
                    imageName: icTrick,
                    imageHeight: 73.h,
                    imageWidth: 73.w,
                    textName: "Tricks",
                  ),
                ],
              ),
              heightBox(31.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CardWidget(
                    height: 150.h,
                    width: 144.w,
                    imageName: icVideo,
                    imageHeight: 73.h,
                    imageWidth: 73.w,
                    textName: "Videos",
                  ),
                  CardWidget(
                    height: 150.h,
                    width: 144.w,
                    imageName: icProfile,
                    imageHeight: 73.h,
                    imageWidth: 73.w,
                    textName: "Profile",
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    ),
                  ),
                ],
              ),
              heightBox(20.h),
            ],
          ),
        ),
      ),
    );
  }
}
