import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../Providers/auth_provider.dart';
import '../../Widgets/common_button.dart';
import '../../Widgets/text_editing_widget.dart';
import '../../Widgets/text_widget.dart';
import '../../base/base_stateful_widget.dart';
import '../../resources/color_resources.dart';
import '../../resources/image_resources.dart';
import '../../resources/strings.dart';
import '../../utils/app_utils.dart';
import '../Settings/TermAndConditionScreen.dart';
import 'LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends BaseStatefulWidgetState<RegisterScreen> {
  bool isHideRegPassword = true;
  bool isHideRegConfirmPassword = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Country _selectedDialogCountry = CountryPickerUtils.getCountryByPhoneCode('39');

  @override
  // TODO: implement scaffoldBgColor
  Color? get scaffoldBgColor => colorBackground;

  @override
  Widget buildBody(BuildContext context) {
    return Consumer<AuthProvider>(builder: (_, authProviderRef, __) {
      return SingleChildScrollView(
        child: Container(
          // height: screenSize.height,
          width: screenSize.width,
          color: colorBackground,
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              heightBox(17.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      icArrowLeft,
                      fit: BoxFit.cover,
                      height: 45.h,
                      width: 45.w,
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    icon,
                    height: 120.h,
                    width: 135.w,
                    fit: BoxFit.fill,
                  ),
                  const Spacer(),
                  const Spacer(),
                ],
              ),
              heightBox(35.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  children: [
                    TextEditingWidget(
                      controller: nameController,
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      labelText: "Your Name",
                      fontSize: 16,
                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    ),
                    heightBox(12.h),
                    TextEditingWidget(
                      controller: emailController,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      labelText: "Email",
                      fontSize: 16,
                      onFieldSubmitted: (value) {
                        Map<String, dynamic> body = {
                          "type": "email",
                          "value": value,
                        };
                        Future.delayed(const Duration(seconds: 0), () {
                          authProviderRef.callApiCheckAbility(body);
                        });
                      },
                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    ),
                    heightBox(12.h),
                    TextEditingWidget(
                      controller: phoneNoController,
                      textInputType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      labelText: "Enter Your Mobile Number",
                      fontSize: 16,
                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                      prefixIcon: SizedBox(
                        width: 75.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.w),
                          child: GestureDetector(
                            onTap: _openCountryPickerDialog,
                            child: Row(
                              children: [
                                widthBox(6.w),
                                Flexible(
                                  child: GestureDetector(
                                    onTap: _openCountryPickerDialog,
                                    child: Container(
                                      child: _buildDialogItem(_selectedDialogCountry, isFromDialog: false),
                                    ),
                                  ),
                                ),
                                // widthBox(10.w),
                                // SvgPicture.asset(icDropdown),
                                Container(
                                  height: 30.h,
                                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                                  child: VerticalDivider(
                                    color: colorBlack.withOpacity(0.3),
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    heightBox(12.h),
                    TextEditingWidget(
                      controller: passwordController,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      passwordVisible: isHideRegPassword,
                      labelText: "Password",
                      fontSize: 16,
                      suffixIconName: isHideRegPassword ? icPassword : icPasswordHide,
                      onTapSuffixIcon: changeRegPassword,
                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    ),
                    heightBox(12.h),
                    TextEditingWidget(
                      controller: confirmPasswordController,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      labelText: "Confirm Password",
                      fontSize: 16,
                      passwordVisible: isHideRegConfirmPassword,
                      suffixIconName: isHideRegConfirmPassword ? icPassword : icPasswordHide,
                      onTapSuffixIcon: changeRegConfirmPassword,
                      onEditingComplete: () => FocusScope.of(context).unfocus(),
                    ),
                    heightBox(20.h),
                    CommonButton(
                      showLoading: authProviderRef.authLoader,
                      width: screenSize.width,
                      text: "Sign Up",
                      fontSize: 19,
                      onTap: () async {
                        if (nameController.text.isEmpty) {
                          AppUtils.toast("Please enter your name", colorRed, colorWhite);
                        } else if (emailController.text.isEmpty) {
                          AppUtils.toast("Please enter your email", colorRed, colorWhite);
                        } else if (phoneNoController.text.isEmpty) {
                          AppUtils.toast("Please enter your phone number", colorRed, colorWhite);
                        } else if (passwordController.text.isEmpty) {
                          AppUtils.toast("Please enter password", colorRed, colorWhite);
                        } else if (confirmPasswordController.text.isEmpty) {
                          AppUtils.toast("Please enter confirm password", colorRed, colorWhite);
                        } else if (passwordController.text != confirmPasswordController.text) {
                          AppUtils.toast("Password and confirm password are not same", colorRed, colorWhite);
                        } else {
                          Map<String, dynamic> body = {
                            "name": nameController.text,
                            "email": emailController.text,
                            "country_code": _selectedDialogCountry.phoneCode,
                            "mobile": phoneNoController.text,
                            "password": passwordController.text,
                            "device_id": await AppUtils.getDeviceId(),
                            "device_type": AppUtils.getDeviceTypeID(),
                            "push_token": "",
                          };
                          // ignore: use_build_context_synchronously
                          authProviderRef.callApiRegister(body, context);
                        }
                      },
                    ),
                    heightBox(18.h),
                    TextWidget(
                      text: "By clicking on sing up you agree with",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: strFontName,
                    ),
                    TextWidget(
                      text: "Terms & Conditions",
                      fontSize: 16,
                      color: colorPrimary,
                      fontWeight: FontWeight.w400,
                      fontFamily: strFontName,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TermAndConditionScreen(),
                        ),
                      ),
                    ),
                    heightBox(10.h),
                    // Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: "Already have account?",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: strFontName,
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: TextWidget(
                            text: "Log In",
                            fontSize: 18,
                            color: colorPrimary,
                            fontWeight: FontWeight.w600,
                            fontFamily: strFontName,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  void _openCountryPickerDialog() {
    FocusScope.of(context).requestFocus(FocusNode());
    showDialog(
      context: context,
      builder: (context) => Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.pink),
        child: CountryPickerDialog(
          titlePadding: const EdgeInsets.all(8.0),
          searchCursorColor: Colors.pinkAccent,
          searchInputDecoration: const InputDecoration(hintText: 'Search...'),
          isSearchable: true,
          title: TextWidget(text: 'Select your country code', fontSize: 16),
          onValuePicked: (Country country) => setState(() => _selectedDialogCountry = country),
          itemBuilder: _buildDialogItem,
        ),
      ),
    );
  }

  Widget _buildDialogItem(Country country, {bool isFromDialog = true}) => isFromDialog
      ? Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            const SizedBox(width: 8.0),
            Text("+${country.phoneCode}"),
            const SizedBox(width: 8.0),
            Flexible(child: Text(country.name))
          ],
        )
      : SizedBox(
          width: 60.w,
          height: 10.h,
          child: AutoSizeText(
            "+${country.phoneCode}",
            textAlign: TextAlign.center,
            // maxLines: 1,
          ));

  changeRegPassword() {
    setState(() {
      isHideRegPassword = !isHideRegPassword;
      setState(() {});
    });
  }

  changeRegConfirmPassword() {
    setState(() {
      isHideRegConfirmPassword = !isHideRegConfirmPassword;
      setState(() {});
    });
  }
}
