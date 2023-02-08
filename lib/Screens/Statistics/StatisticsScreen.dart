import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:webpatente/Widgets/common_appbar.dart';
import 'package:webpatente/resources/color_resources.dart';
import '../../Models/Statistics_Model.dart';
import '../../Providers/statistics_provider.dart';
import '../../Widgets/text_widget.dart';
import '../../base/base_stateful_widget.dart';
import '../../resources/image_resources.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends BaseStatefulWidgetState<StatisticsScreen> {
  late StatisticsProvider statisticsProviderRef;

  @override
  void initState() {
    // TODO: implement initState
    statisticsProviderRef = Provider.of<StatisticsProvider>(context, listen: false);
    Future.delayed(const Duration(seconds: 0), () {
      statisticsProviderRef.callApiQuizResult();
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
      title: "Statistics",
      backIcon: icArrowLeft,
      backIconHeight: 45.h,
      backIconWidth: 45.w,
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Consumer<StatisticsProvider>(builder: (_, statisticsProviderRef, __) {
      return
          // statisticsProviderRef.statisticsLoader ?

          Column(
        children: [
          statisticsProviderRef.statisticsLoader
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[200]!,
                  highlightColor: Colors.grey[350]!,
                  child: Container(
                    color: colorBackground,
                    height: 200.h,
                    width: screenSize.width,
                  ),
                )
              : Container(
                  height: 200.h,
                  width: screenSize.width,
                  color: colorPrimary,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      heightBox(35.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              TextWidget(
                                text: double.tryParse(statisticsProviderRef.correct!)?.toStringAsFixed(0),
                                fontWeight: FontWeight.w800,
                                color: colorWhite,
                                fontSize: 25.sp,
                              ),
                              TextWidget(
                                text: "Correct",
                                fontWeight: FontWeight.w500,
                                color: colorWhite,
                                fontSize: 14.sp,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              TextWidget(
                                text: double.tryParse(statisticsProviderRef.notAnswer!)?.toStringAsFixed(0),
                                fontWeight: FontWeight.w800,
                                color: colorWhite,
                                fontSize: 25.sp,
                              ),
                              TextWidget(
                                text: "Not Answered",
                                fontWeight: FontWeight.w500,
                                color: colorWhite,
                                fontSize: 14.sp,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              TextWidget(
                                text: double.tryParse(statisticsProviderRef.inCorrect!)?.toStringAsFixed(0),
                                fontWeight: FontWeight.w800,
                                color: colorWhite,
                                fontSize: 25.sp,
                              ),
                              TextWidget(
                                text: "Incorrect",
                                fontWeight: FontWeight.w500,
                                color: colorWhite,
                                fontSize: 14.sp,
                              ),
                            ],
                          )
                        ],
                      ),
                      heightBox(32.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              TextWidget(
                                text: "${statisticsProviderRef.totalPassed}%",
                                fontWeight: FontWeight.w800,
                                color: colorWhite,
                                fontSize: 25.sp,
                              ),
                              TextWidget(
                                text: "Total Passed",
                                fontWeight: FontWeight.w500,
                                color: colorWhite,
                                fontSize: 14.sp,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              TextWidget(
                                text: "${statisticsProviderRef.totalFailed}%",
                                fontWeight: FontWeight.w800,
                                color: colorWhite,
                                fontSize: 25.sp,
                              ),
                              TextWidget(
                                text: "Total Failed",
                                fontWeight: FontWeight.w500,
                                color: colorWhite,
                                fontSize: 14.sp,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
          Expanded(
            child: statisticsProviderRef.statisticsLoader
                ? Shimmer.fromColors(
                    baseColor: Colors.grey[200]!,
                    highlightColor: Colors.grey[350]!,
                    child: Container(
                      color: colorBackground,
                      // height:200.h,
                      width: screenSize.width,
                    ),
                  )
                : Container(
                    width: screenSize.width,
                    color: colorWhite,
                    child: Column(
                      children: [
                        heightBox(31.h),
                        TextWidget(
                          text: "Quiz Performance",
                          fontWeight: FontWeight.w600,
                          fontSize: 22.sp,
                        ),
                        heightBox(10.h),
                        SfCartesianChart(
                          zoomPanBehavior: ZoomPanBehavior(
                            enablePanning: true,
                          ),
                          primaryXAxis: CategoryAxis(
                            majorGridLines: const MajorGridLines(
                              width: 0,
                            ),
                            autoScrollingMode: AutoScrollingMode.start,
                            autoScrollingDelta: 5,
                          ),
                          legend: Legend(isVisible: false),
                          tooltipBehavior: TooltipBehavior(
                            enable: false,
                          ),
                          series: <CartesianSeries<Graph, String>>[
                            ColumnSeries<Graph, String>(
                              dataSource: statisticsProviderRef.graphList,
                              width: statisticsProviderRef.graphList.length < 3 ? 0.1 : 0.4,
                              xValueMapper: (Graph data, index) => "Quiz ${index +1}",
                              yValueMapper: (Graph data, _) => double.parse(data.percentage!).round(),
                              borderRadius: BorderRadius.circular(12),
                              isVisibleInLegend: false,
                              pointColorMapper: (Graph data, _) => data.result!.toUpperCase() == "PASS" ? colorPrimary : colorRed,
                            ),
                          ],
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

class ChartData {
  ChartData(
    this.x,
    this.y,
  );

  final String x;
  final double? y;
}
