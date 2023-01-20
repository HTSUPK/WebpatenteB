import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webpatente/Widgets/text_widget.dart';
import 'package:webpatente/resources/color_resources.dart';
import '../../Widgets/questionItem_widget.dart';
import '../../Widgets/text_editing_widget.dart';
import '../../base/base_stateful_widget.dart';
import '../../resources/image_resources.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends BaseStatefulWidgetState<QuestionScreen> {
  final List<String> _locations = ['Legends Of USA', 'B', 'C', 'D'];
  String _selectedLocation = 'A';

  /// Language ///

  String dropdownvalue = 'Hindi';

  // List of items in our dropdown menu
  var items = [
    'Hindi',
    'English',
  ];

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
          height: 170.h,
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextWidget(
                        text: "Choose a topic",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: colorWhite,
                      ),
                      SizedBox(
                        height: 40,
                        width: screenSize.width / 2,
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor: colorPrimary,
                          ),
                          child: DropdownButtonFormField(
                            iconEnabledColor: colorWhite,
                            elevation: 0,
                            isDense: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(0),
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
            color: colorBackground,
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(8.w, 10.h, 8.w, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorWhite,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg",
                                height: 55.h,
                                width: 70.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            widthBox(10.w),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200.w,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        text: "Lorem Ipsum is simply dummy text of the printing and type setting industry.",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        maxLines: 3,
                                      ),
                                      heightBox(5.h),
                                      Row(
                                        children: [
                                          const QuestionItem(
                                            iconName: icSpeak,
                                            text: "Speak",
                                          ),
                                          widthBox(10.w),
                                          const QuestionItem(
                                            iconName: icTranslate,
                                            text: "Translate",
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 44.h,
                                  width: 44.w,
                                  decoration: BoxDecoration(
                                    color: colorDarkGreen,
                                    borderRadius: BorderRadius.circular(44),
                                  ),
                                  child: Center(
                                    child: TextWidget(
                                      text: "T",
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: colorWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        heightBox(8.h),
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: dropdownvalue,
                            isDense: true,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                          ),
                        ),
                        heightBox(8.h),
                        TextWidget(
                          text: "Hindi: कहानी के लिए समय अवधि या सेटिंग कितनी महत्वपूर्ण थी?",
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
