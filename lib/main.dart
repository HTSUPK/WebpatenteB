import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'Providers/auth_provider.dart';
import 'Providers/profile_provider.dart';
import 'Providers/question_provider.dart';
import 'Providers/quiz_provider.dart';
import 'Providers/setting_provider.dart';
import 'Providers/statistics_provider.dart';
import 'Providers/versionCheck_provider.dart';
import 'Screens/Splash/SplashScreen.dart';
import 'Widgets/NetworkOff.dart';
import 'utils/app_utils.dart';
import 'utils/shared_preference_util.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await SharedPreferenceUtil.getInstance();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<ProfileProvider>(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider<VersionCheckProvider>(
          create: (context) => VersionCheckProvider(),
        ),
        ChangeNotifierProvider<QuizProvider>(
          create: (context) => QuizProvider(),
        ),
        ChangeNotifierProvider<QuestionProvider>(
          create: (context) => QuestionProvider(),
        ),
        ChangeNotifierProvider<SettingProvider>(
          create: (context) => SettingProvider(),
        ),
        ChangeNotifierProvider<StatisticsProvider>(
          create: (context) => StatisticsProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ConnectivityResult connectionStatus = ConnectivityResult.none;
  // final Connectivity connectivity = Connectivity();
  // late StreamSubscription<ConnectivityResult> connectivitySubscription;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   initConnectivity();
  //   connectivitySubscription = connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  // }
  //
  // @override
  // void dispose() {
  //   connectivitySubscription.cancel();
  //   super.dispose();
  // }
  //
  // Future<void> initConnectivity() async {
  //   late ConnectivityResult result;
  //   try {
  //     result = await connectivity.checkConnectivity();
  //   } on PlatformException catch (e) {
  //     // print(e.toString());
  //     return;
  //   }
  //   if (!mounted) {
  //     return Future.value(null);
  //   }
  //   return _updateConnectionStatus(result);
  // }
  //
  // Future<void> _updateConnectionStatus(ConnectivityResult result) async {
  //   setState(() {
  //     connectionStatus = result;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) => GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: MaterialApp(
          title: 'Webpatente',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: MyBehavior(),
              child: child!,
            );
          },
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
