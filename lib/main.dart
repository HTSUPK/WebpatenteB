import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'Providers/auth_provider.dart';
import 'Providers/profile_provider.dart';
import 'Providers/question_provider.dart';
import 'Providers/quiz_provider.dart';
import 'Providers/setting_provider.dart';
import 'Providers/versionCheck_provider.dart';
import 'Screens/Splash/SplashScreen.dart';
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
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
