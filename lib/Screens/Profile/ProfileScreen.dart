import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../Providers/auth_provider.dart';
import '../../Providers/profile_provider.dart';
import '../../Widgets/common_appbar.dart';
import '../../Widgets/profileItem_widget.dart';
import '../../Widgets/text_widget.dart';
import '../../base/base_stateful_widget.dart';
import '../../resources/color_resources.dart';
import '../../resources/image_resources.dart';
import '../../resources/strings.dart';
import '../../utils/app_constants.dart';
import '../../utils/shared_preference_util.dart';
import '../Settings/SettingScreen.dart';
import '../Settings/TermAndConditionScreen.dart';
import 'EditProfileScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseStatefulWidgetState<ProfileScreen> {
  late ProfileProvider profileProviderRef;

  @override
  void initState() {
    // TODO: implement initState
    profileProviderRef = Provider.of<ProfileProvider>(context, listen: false);
    Future.delayed(const Duration(seconds: 0), () {
      profileProviderRef.callApiGetUserProfile();
    });
    super.initState();
  }

  @override
  // TODO: implement scaffoldBgColor
  Color? get scaffoldBgColor => colorPrimary;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    // TODO: implement buildAppBar
    return CommonAppBar(
      title: "Profile",
      backIcon: icArrowLeft,
      backIconHeight: 45.h,
      backIconWidth: 45.w,
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Consumer<AuthProvider>(builder: (_, authProviderRef, __) {
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
                CircleAvatar(
                  radius: 60,
                  backgroundColor: colorWhite,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(
                      SharedPreferenceUtil.getString(userProfileImage),
                    ),
                  ),
                ),
                heightBox(14.h),
                TextWidget(
                  text: SharedPreferenceUtil.getString(userName),
                  fontSize: 24,
                  color: colorWhite,
                  fontFamily: strFontName,
                  fontWeight: FontWeight.w700,
                ),
                TextWidget(
                  text: SharedPreferenceUtil.getString(userEmail),
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
                  ProfileItem(
                    iconName: icTernCondition,
                    textName: "Terms & Conditions",
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TermAndConditionScreen(),
                      ),
                    ),
                  ),
                  const ProfileItem(
                    iconName: icFeedback,
                    textName: "Feedback",
                  ),
                  ProfileItem(
                    iconName: icLogout,
                    textName: "Log Out",
                    onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        backgroundColor: colorPrimary,
                        title: TextWidget(
                          text: "Log Out",
                          fontSize: 18,
                          color: colorWhite,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w600,
                        ),
                        content: TextWidget(
                          text: "Are you sure to logout this app?",
                          color: colorWhite,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w500,
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: TextWidget(
                              text: "Cancel",
                              color: colorWhite,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.of(context).pop();
                              authProviderRef.callApiLogout(this.context);
                            },
                            child: TextWidget(
                              text: "Logout",
                              color: colorWhite,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
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
    });
  }
}
