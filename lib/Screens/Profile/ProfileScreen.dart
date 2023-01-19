import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Widgets/common_appbar.dart';
import '../../Widgets/profileItem_widget.dart';
import '../../Widgets/text_widget.dart';
import '../../base/base_stateful_widget.dart';
import '../../resources/color_resources.dart';
import '../../resources/image_resources.dart';
import '../../resources/strings.dart';
import '../Settings/SettingScreen.dart';
import 'EditProfileScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseStatefulWidgetState<ProfileScreen> {
  @override
  // TODO: implement scaffoldBgColor
  Color? get scaffoldBgColor => colorPrimary;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    // TODO: implement buildAppBar
    return const CommonAppBar(
      title: "Profile",
      backIcon: icArrowLeft,
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 292.h,
          width: screenSize.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(icProfileBackground),
            fit: BoxFit.fill,
          )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              heightBox(22.h),
              const CircleAvatar(
                radius: 60,
                backgroundColor: colorWhite,
                child: CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(
                    "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg",
                  ),
                ),
              ),
              heightBox(14.h),
              TextWidget(
                text: "Marcus Levin",
                fontSize: 24,
                color: colorWhite,
                fontFamily: strFontName,
                fontWeight: FontWeight.w700,
              ),
              TextWidget(
                text: "diannerussell@gmail.com",
                fontSize: 16,
                color: colorWhite,
                fontFamily: strFontName,
                fontWeight: FontWeight.w400,
              ),
              heightBox(17.h),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfileScreen(),
                  ),
                ),
                child: Container(
                  height: 41.h,
                  width: 127.w,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    color: colorWhite,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: TextWidget(
                    text: "Edit Profile",
                    fontSize: 15,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: screenSize.width,
            color: colorBackground,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                heightBox(30.h),
                ProfileItem(
                  iconName: icSetting,
                  textName: "Settings",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingScreen(),
                    ),
                  ),
                ),
                const ProfileItem(
                  iconName: icTernCondition,
                  textName: "Terms & Conditions",
                ),
                const ProfileItem(
                  iconName: icFeedback,
                  textName: "Feedback",
                ),
                const ProfileItem(
                  iconName: icLogout,
                  textName: "Log Out",
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: colorDarkBlue,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
