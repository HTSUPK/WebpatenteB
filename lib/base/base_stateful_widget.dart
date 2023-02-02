import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../resources/color_resources.dart';
import '../utils/app_utils.dart';
import '../utils/page_transition_utils.dart';

abstract class BaseStatefulWidgetState<StateMVC extends StatefulWidget> extends State<StateMVC> {
  late ThemeData baseTheme;
  bool shouldShowProgress = false;
  bool shouldHaveSafeArea = true;
  final rootScaffoldKey = GlobalKey<ScaffoldState>();
  bool resizeToAvoidBottomInset = true;
  late Size screenSize;
  bool isBackgroundImage = false;
  bool extendBodyBehindAppBar = false;
  Color? scaffoldBgColor;
  FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  void didChangeDependencies() {
    baseTheme = Theme.of(context);
    screenSize = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onError(String errorMessageKey) {
    // do nothing
  }

  // void showError(
  //   String errorMessage,
  //   ScaffoldState state, {
  //   Color color = colorWhite,///TODO : change as per app
  // }) {
  //   AppUtils.instance.showMessage(errorMessage, state);
  // }

  // void showMessage(
  //   String message,
  //   ScaffoldState state, {
  //   Color color =  colorWhite,///TODO : change as per app
  // }) {
  //   AppUtils.instance.showMessage(message, state);
  // }

  void hideProgress() {
    // AppUtils.instance.hideProgress(context); TODO
  }

  void showProgress() {
    // AppUtils.instance.showProgress(context); TODO
  }

  void pushAndClearStack(
    BuildContext context, {
    required Widget enterPage,
    bool shouldUseRootNavigator = false,
  }) {
    ScaffoldMessenger.of(rootScaffoldKey.currentContext!).hideCurrentSnackBar();
    Navigator.of(context, rootNavigator: shouldUseRootNavigator).pushAndRemoveUntil(SlideLeftRoute(page: enterPage), (Route<dynamic> route) => false);
  }

  void pushReplacement(
    BuildContext context, {
    required Widget enterPage,
    bool shouldUseRootNavigator = false,
  }) {
    ScaffoldMessenger.of(rootScaffoldKey.currentContext!).hideCurrentSnackBar();
    Navigator.of(context, rootNavigator: shouldUseRootNavigator).pushReplacement(
      SlideLeftRoute(page: enterPage),
    );
  }

  void goBack() {
    Navigator.pop(rootScaffoldKey.currentContext!);
  }

  void push(
    BuildContext context, {
    required Widget enterPage,
    bool shouldUseRootNavigator = false,
    Function? callback,
  }) {
    ScaffoldMessenger.of(rootScaffoldKey.currentContext!).hideCurrentSnackBar();
    FocusScope.of(rootScaffoldKey.currentContext!).requestFocus(FocusNode());
    Navigator.of(context, rootNavigator: shouldUseRootNavigator)
        .push(
      SlideLeftRoute(page: enterPage),
    )
        .then((value) {
      callback?.call(value);
    });
  }

  Future<dynamic> pushForResult(
    BuildContext context, {
    required Widget enterPage,
    bool shouldUseRootNavigator = false,
  }) {
    return Navigator.of(context, rootNavigator: shouldUseRootNavigator).push(
      SlideLeftRoute(page: enterPage),
    );
  }

  Widget heightBox(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget widthBox(double width) {
    return SizedBox(
      width: width,
    );
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  @protected
  @mustCallSuper
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(rootScaffoldKey.currentContext!).requestFocus(FocusNode()),
      child: Scaffold(
        key: rootScaffoldKey,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        extendBody: false,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        backgroundColor: scaffoldBgColor,
        appBar: buildAppBar(context),
        drawer: buildDrawer(context),
        body: (shouldHaveSafeArea)
            ? SafeArea(
                bottom: true,
                child: (!isBackgroundImage)
                    ? buildBody(context)
                    : SizedBox(
                        width: screenSize.width,
                        height: screenSize.height,
                        /*decoration:
                            const BoxDecoration(image: DecorationImage(image: AssetImage(imgScreenBg), fit: BoxFit.fill)),*/
                        child: buildBody(context),
                      ))
            : (!isBackgroundImage)
                ? SizedBox(
                    width: screenSize.width,
                    height: screenSize.height,
                    /* decoration:
                        const BoxDecoration(image: DecorationImage(image: AssetImage(imgScreenBg), fit: BoxFit.fill)),*/
                    child: buildBody(context),
                  )
                : buildBody(context),
        bottomNavigationBar: buildBottomNavigationBar(context),
        floatingActionButton: buildFloatingActionButton(context),
        floatingActionButtonLocation: floatingActionButtonLocation ?? FloatingActionButtonLocation.endDocked,
      ),
    );
  }

  @protected
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return null;
  }

  Widget buildBody(BuildContext context) {
    return widget;
  }

  Widget? buildDrawer(BuildContext context) {
    return null;
  }

  Widget? buildFloatingActionButton(BuildContext context) {
    return null;
  }

  Widget? buildBottomNavigationBar(BuildContext context) {
    return null;
  }
}
