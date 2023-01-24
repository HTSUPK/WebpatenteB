import 'package:auto_size_text/auto_size_text.dart';
import 'package:image_picker/image_picker.dart';
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
import '../../utils/app_constants.dart';
import '../../utils/shared_preference_util.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends BaseStatefulWidgetState<EditProfileScreen> {
  String phoneCode = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    phoneCode = SharedPreferenceUtil.getString(userPhoneCode);
    nameController.text = SharedPreferenceUtil.getString(userName);
    phoneNoController.text = SharedPreferenceUtil.getString(userPhoneNo);
    emailController.text = SharedPreferenceUtil.getString(userEmail);
    super.initState();
  }

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
            SizedBox(
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
                    bottom: 10.h,
                    right: 10.w,
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
              controller: nameController,
              textInputType: TextInputType.name,
              textInputAction: TextInputAction.done,
              labelText: "Your Name",
              fontSize: 16,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
            ),
            heightBox(12.h),
            TextEditingWidget(
              controller: emailController,
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              readOnly: true,
              labelText: "Email",
              fontSize: 16,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
            ),
            heightBox(12.h),
            TextEditingWidget(
              controller: phoneNoController,
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.next,
              labelText: "Mobile Number",
              readOnly: true,
              fontSize: 16,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
              prefixIcon: SizedBox(
                width: 75.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  child: Row(
                    children: [
                      widthBox(6.w),
                      Flexible(
                          child: SizedBox(
                        width: 60.w,
                        height: 10.h,
                        child: AutoSizeText(
                          phoneCode,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: colorBlack,
                            fontSize: 16,
                            fontFamily: strFontName,
                            fontWeight: FontWeight.w600,
                          ),
                          // maxLines: 1,
                        ),
                      )),
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
                leading: const Icon(Icons.photo_camera),
                title: TextWidget(
                  text: "Camera",
                  fontSize: 16,
                  fontFamily: strFontName,
                  fontWeight: FontWeight.w500,
                ),
                onTap: () {
                  setState(() {
                    camera();
                  });
                },
              ),
              ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: TextWidget(
                    text: "Gallery",
                    fontSize: 16,
                    fontFamily: strFontName,
                    fontWeight: FontWeight.w500,
                  ),
                  onTap: () {
                    setState(() {
                      gallery();
                    });
                  }),
            ],
          ),
        );
      },
    );
  }

  void gallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    // if (pickedFile != null) {
    //   proImage = File(pickedFile.path);
    //   List<int> imageBytes = proImage!.readAsBytesSync();
    //   image = base64Encode(imageBytes);
    //   File file = File(pickedFile.path);
    //   fileExtension = extension(file.path);
    // } else {
    //   print('No image selected.');
    // }
  }

  void camera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    // if (pickedFile != null) {
    //   proImage = File(pickedFile.path);
    //   List<int> imageBytes = proImage!.readAsBytesSync();
    //   image = base64Encode(imageBytes);
    //   File file = File(pickedFile.path);
    //   fileExtension = extension(file.path);
    // } else {
    //   print('No image selected.');
    // }
  }

/*void _openCountryPickerDialog() {
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
        ),
        );*/
}
