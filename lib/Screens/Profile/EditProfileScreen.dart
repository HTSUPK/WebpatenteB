import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Widgets/common_appbar.dart';
import '../../Widgets/common_button.dart';
import '../../Widgets/text_editing_widget.dart';
import '../../Widgets/text_widget.dart';
import '../../base/base_stateful_widget.dart';
import '../../resources/color_resources.dart';
import '../../resources/image_resources.dart';
import '../../resources/strings.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends BaseStatefulWidgetState<EditProfileScreen> {
  Country _selectedDialogCountry = CountryPickerUtils.getCountryByPhoneCode('1');

  @override
  // TODO: implement scaffoldBgColor
  Color? get scaffoldBgColor => colorBackground;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    // TODO: implement buildAppBar
    return const CommonAppBar(
      title: "Edit Profile",
      backIcon: icArrowLeft,
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          children: [
            heightBox(32.h),
            Container(
              height: 129.h,
              width: 129.w,
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 65,
                    backgroundColor: colorWhite,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        "https://hexeros.com/dev/superapp/uploads/user/user.png",
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15.h,
                    right: 15.w,
                    child: GestureDetector(
                      onTap: () => chooseProfileImage(),
                      child: Image.asset(
                        icCamera,
                        height: 35.h,
                        width: 35.w,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  )
                ],
              ),
            ),
            heightBox(30.h),
            TextEditingWidget(
              textInputType: TextInputType.name,
              textInputAction: TextInputAction.next,
              labelText: "Your Name",
              fontSize: 16,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
            ),
            heightBox(12.h),
            TextEditingWidget(
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              labelText: "Email",
              fontSize: 16,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
            ),
            heightBox(12.h),
            TextEditingWidget(
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
            CommonButton(
              width: screenSize.width,
              text: "Save",
              fontSize: 19,
              onTap: () {},
            ),
            heightBox(12.h),
          ],
        ),
      ),
    );
  }

  void chooseProfileImage() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: TextWidget(
                    text: "From Gallery",
                    fontSize: 16,
                    fontFamily: strFontName,
                    fontWeight: FontWeight.w500,
                  ),
                  onTap: () {}),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: TextWidget(
                  text: "From Camera",
                  fontSize: 16,
                  fontFamily: strFontName,
                  fontWeight: FontWeight.w500,
                ),
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
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
}
