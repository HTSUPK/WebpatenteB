import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webpatente/Widgets/text_widget.dart';
import 'package:webpatente/resources/color_resources.dart';
import '../../Widgets/text_editing_widget.dart';
import '../../base/base_stateful_widget.dart';
import '../../resources/image_resources.dart';
import '../../resources/strings.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends BaseStatefulWidgetState<QuestionScreen> {
  final List<String> _locations = ['Legends Of USA', 'B', 'C', 'D'];
  String _selectedLocation = 'A';

  @override
  void initState() {
    // TODO: implement initState
    _selectedLocation = _locations[0];
    super.initState();
  }

  @override
  // TODO: implement scaffoldBgColor
  Color? get scaffoldBgColor => colorPrimary;

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 165.h,
          color: colorPrimary,
          padding: EdgeInsets.symmetric(horizontal: 21.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightBox(5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: "Choose a topic",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: colorWhite,
                      ),
                      // DropdownButton(
                      //   value: _selectedLocation,
                      //   onChanged: (String? newValue) {
                      //     setState(() {
                      //       _selectedLocation = newValue!;
                      //     });
                      //   },
                      //   items: _locations.map((String location) {
                      //     return DropdownMenuItem<String>(
                      //       child: Text(location),
                      //     );
                      //   }).toList(),
                      // ),
                      SizedBox(
                        width: screenSize.width / 2,
                        child: DropdownButtonFormField(
                          iconEnabledColor: colorWhite,
                          elevation: 0,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          value: _selectedLocation,
                          items: _locations.map((accountType) {
                            return DropdownMenuItem(
                              value: accountType,
                              child: TextWidget(
                                text: accountType,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: colorWhite,
                              ),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              _selectedLocation = val!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    icClose,
                    fit: BoxFit.fitWidth,
                    height: 35.h,
                    width: 35.w,
                  ),
                ],
              ),
              heightBox(12.h),
              TextWidget(
                text: "Solutions of the group of quiz n. 362",
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: colorWhite,
              ),
              heightBox(12.h),
              Row(
                children: [
                  Image.asset(
                    icPreviewButton,
                    fit: BoxFit.cover,
                    height: 51.h,
                    width: 51.w,
                  ),
                  Image.asset(
                    icNextButton,
                    fit: BoxFit.cover,
                    height: 51.h,
                    width: 51.w,
                  ),
                  widthBox(10.w),
                  SizedBox(
                    width: 132.w,
                    height: 50.h,
                    child: TextEditingWidget(
                      width: 132.w,
                      height: 50.h,
                      textInputType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      labelText: "Write Page No",
                      labelSize: 16,
                      labelColor: colorBlack.withOpacity(0.5),
                      fontSize: 16,
                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    ),
                  ),
                  widthBox(5.w),
                  Container(
                    decoration: BoxDecoration(
                      color: colorGoButton,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: colorBlack.withOpacity(.13),
                          spreadRadius: 10,
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: TextWidget(
                      text: "Go",
                      color: colorBlack.withOpacity(0.5),
                      fontWeight: FontWeight.w700,
                      fontSize: 22.sp,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
            child: Container(
          color: colorWhite,
        ))
      ],
    );
  }
}
