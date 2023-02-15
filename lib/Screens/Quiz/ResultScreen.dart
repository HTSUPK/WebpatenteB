import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:webpatente/base/base_stateful_widget.dart';
import '../../Providers/quiz_provider.dart';
import '../../Widgets/statistics_detail_widget.dart';
import '../../Widgets/text_widget.dart';
import '../../resources/color_resources.dart';
import '../../resources/image_resources.dart';

class ResultScreen extends StatefulWidget {
  final List? result;
  final String? time;

  const ResultScreen({
    super.key,
    this.result,
    this.time,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends BaseStatefulWidgetState<ResultScreen> {
  late QuizProvider quizProviderRef;

  @override
  void initState() {
    // TODO: implement initState
    quizProviderRef = Provider.of<QuizProvider>(context, listen: false);
    quizProviderRef.isCalculate();
    super.initState();
  }

  // List<String> strCorrectAns = [];
  // List<String> strYourAns = [];

  @override
  // TODO: implement scaffoldBgColor
  Color? get scaffoldBgColor => colorPrimary;

  @override
  Widget buildBody(BuildContext context) {
    return Consumer<QuizProvider>(builder: (_, quizProviderRef, __) {
      return Column(
        children: [
          Container(
            height: 142.h,
            color: colorPrimary,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      const Spacer(),
                      TextWidget(
                        text: "Result (${widget.time!})",
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: colorWhite,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset(
                          icClose,
                          fit: BoxFit.fitWidth,
                          height: 35.h,
                          width: 35.w,
                        ),
                      ),
                    ],
                  ),
                ),
                heightBox(20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatisticsDetail(
                        detailText: quizProviderRef.correct.toString(),
                        detailFontSize: 32,
                        nameText: "Correct",
                        nameFontSize: 17,
                      ),
                      StatisticsDetail(
                        detailText: quizProviderRef.notAnswered.toString(),
                        detailFontSize: 32,
                        nameText: "Not Answered",
                        nameFontSize: 17,
                      ),
                      StatisticsDetail(
                        detailText: quizProviderRef.incorrect.toString(),
                        detailFontSize: 32,
                        nameText: "Incorrect",
                        nameFontSize: 17,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: screenSize.width,
              color: colorBackground,
              child: ListView.builder(
                  itemCount: widget.result!.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    /// User Answer ///
                   String strCorrectAns = "";
                    if(widget.result![index].correct == "true"){
                      strCorrectAns = "Vero";
                    }else{
                      strCorrectAns = "Falso";
                    }

                    /// Correct Answer ///
                   String strYourAns = "";
                   if(widget.result![index].yourAnswer == "true"){
                     strYourAns = "Vero";
                   }else{
                     strYourAns = "Falso";
                   }
                    return Padding(
                      padding: EdgeInsets.fromLTRB(8.w, 10.h, 8.w, 0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: colorWhite,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                widget.result![index].image != "" ?
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child:
                                  Image.network(
                                    widget.result![index].image!,
                                    height: 55.h,
                                    width: 70.w,
                                    fit: BoxFit.cover,
                                  ),
                                ) : const SizedBox() ,
                                widthBox(10.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        text: "${index + 1} .  ${widget.result![index].question!}",
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        maxLines: 3,
                                      ),
                                      heightBox(7.h),
                                      TextWidget(
                                        // text: "Your Answer: ${widget.result![index].yourAnswer!}",
                                        text: "Your Answer: $strYourAns",
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: widget.result![index].yourAnswer == widget.result![index].correct
                                            ? colorPrimary
                                            : colorRed,
                                      ),
                                      heightBox(3.h),
                                      TextWidget(
                                        // text: "Correct Answer: ${widget.result![index].correct!}",
                                        text: "Correct Answer: $strCorrectAns",
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          heightBox(8.h),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      );
    });
  }
}
