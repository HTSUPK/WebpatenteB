import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../Widgets/common_appbar.dart';
import '../../base/base_stateful_widget.dart';
import '../../resources/image_resources.dart';

class TermAndConditionScreen extends StatefulWidget {
  const TermAndConditionScreen({Key? key}) : super(key: key);

  @override
  State<TermAndConditionScreen> createState() => _TermAndConditionScreenState();
}

class _TermAndConditionScreenState extends BaseStatefulWidgetState<TermAndConditionScreen> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    // TODO: implement buildAppBar
    return CommonAppBar(
      title: "Terms & Conditions",
      backIcon: icArrowLeft,
      backIconHeight: 45.h,
      backIconWidth: 45.w,
    );
  }

  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://flutter.dev'),
      );
  }

  @override
  Widget buildBody(BuildContext context) {
    return WebViewWidget(

      controller: controller,
    );
  }
}