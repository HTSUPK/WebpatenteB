class Apis {
  static const String baseUrl = "https://hexeros.com/dev/web-patente/api/V1/";
  static const String register = "signup";
  static const String login = "login";
  static const String forgotPassword = "forgot_password";
  static const String getUserProfile = "user/get_profile";
  static const String editUserProfile = "user/edit_profile";
  static const String changePassword = "user/change_password";
  static const String logout = "user/logout";
  static const String versionChecker = "version_checker";
  static const String question = "question/question_list";
  static const String chapterList = "chapter/chapter_list";
  static const String selectQuiz = "quiz/selected_quizlist";
  static const String fullQuiz = "quiz/full_quizlist";
  static const String notificationFlag = "user/notification_flag";
  static const String checkAbility = "check_ability";
}

// flutter pub run build_runner build --delete-conflicting-outputs