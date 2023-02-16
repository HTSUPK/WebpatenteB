import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Widgets/card_widget.dart';
import '../../Widgets/common_button.dart';
import '../../Widgets/quizType_widget.dart';
import '../../Widgets/text_widget.dart';
import '../../base/base_stateful_widget.dart';
import '../../resources/color_resources.dart';
import '../../resources/image_resources.dart';
import '../../resources/strings.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_utils.dart';
import '../../utils/shared_preference_util.dart';
import '../Profile/EditProfileScreen.dart';
import '../Profile/ProfileScreen.dart';
import '../Question/QuestionScreen.dart';
import '../Quiz/QuizScreen.dart';
import '../Quiz/SelectChapterScreen.dart';
import '../Statistics/StatisticsScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseStatefulWidgetState<HomeScreen> {
  @override
  // TODO: implement scaffoldBgColor
  Color? get scaffoldBgColor => colorPrimary;

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      color: colorBackground,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 300.h,
              width: screenSize.width,
              color: colorPrimary,
              child: Column(
                children: [
                  heightBox(25.h),
                  Padding(
                    padding: EdgeInsets.only(left: 24.w, right: 5.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditProfileScreen(),
                            ),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: colorWhite,
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(
                                    SharedPreferenceUtil.getString(userProfileImage),
                                  ),
                                ),
                              ),
                              widthBox(15.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: SharedPreferenceUtil.getString(userName),
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
                            ],
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            AppUtils.toast("Coming Soon", colorPrimary, colorWhite);
                          },
                          child: SizedBox(
                            height: 80.h,
                            width: 80.w,
                            child: Image.asset(
                              icVip,
                            ),
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
                        height: 140.h,
                        width: 144.w,
                        imageName: icQuestion,
                        imageHeight: 73.h,
                        imageWidth: 73.w,
                        textName: "Questions",
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QuestionScreen(),
                          ),
                        ),
                      ),
                      CardWidget(
                        height: 140.h,
                        width: 144.w,
                        imageName: icQuiz,
                        imageHeight: 73.h,
                        imageWidth: 73.w,
                        textName: "Quiz",
                        onTap: () => showBottomSheet(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                heightBox(40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardWidget(
                        height: 140.h,
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
                      height: 140.h,
                      width: 144.w,
                      imageName: icTrick,
                      imageHeight: 73.h,
                      imageWidth: 73.w,
                      textName: "Tricks",
                      onTap: () {
                        AppUtils.toast("Coming Soon", colorPrimary, colorWhite);
                      },
                    ),
                  ],
                ),
                heightBox(31.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardWidget(
                      height: 140.h,
                      width: 144.w,
                      imageName: icVideo,
                      imageHeight: 73.h,
                      imageWidth: 73.w,
                      textName: "Videos",
                      onTap: () {
                        AppUtils.toast("Coming Soon", colorPrimary, colorWhite);
                      },
                    ),
                    CardWidget(
                      height: 140.h,
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
                heightBox(5.h),
              ],
            ),
          ],
        ),
      ),
    );
  }

  showBottomSheet() {
    int isSelect = 0;
    List<String> quizName = [
      "Full Quiz",
      "Selected Only",
    ];

    return showModalBottomSheet(
      context: context,
      elevation: 10,
      isScrollControlled: true,
      isDismissible: false,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width - 17, // here increase or decrease in width
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter myState) {
            return Container(
              height: 450.h,
              width: screenSize.width,
              decoration: BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.circular(24),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  heightBox(10.h),
                  Container(
                    width: 114.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: const Color(0XFFD9D9D9),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  heightBox(40.h),
                  Image.asset(
                    icQuiz,
                    height: 83.h,
                    width: 73.w,
                    fit: BoxFit.cover,
                  ),
                  heightBox(8.h),
                  TextWidget(
                    text: "Start Quiz",
                    fontSize: 31,
                    fontWeight: FontWeight.w700,
                    fontFamily: strFontName,
                  ),
                  heightBox(38.h),
                  TextWidget(
                    text: "Please select type of quiz",
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                    fontFamily: strFontName,
                  ),
                  heightBox(19.h),
                  ListView.builder(
                      itemCount: quizName.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            QuizType(
                              name: quizName[index],
                              onTap: () {
                                myState(() {
                                  isSelect = index;
                                  myState(() {});
                                });
                              },
                              isSelect: isSelect == index ? true : false,
                            ),
                            heightBox(10.h),
                          ],
                        );
                      }),
                  CommonButton(
                    width: screenSize.width,
                    text: "Continue",
                    fontSize: 22,
                    onTap: () {
                      if (isSelect == 0) {
                        Navigator.pop(this.context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QuizScreen(
                              where: "full",
                            ),
                          ),
                        );
                      } else if (isSelect == 1) {
                        Navigator.pop(this.context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelectChapterScreen(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
