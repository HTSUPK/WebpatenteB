// ignore_for_file: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../Models/Auth_Model.dart';
import '../Models/ChapterList_Model.dart';
import '../Models/FullQuiz_Model.dart';
import '../Models/Question_Model.dart';
import '../Models/SelectedQuiz_Model.dart';
import '../Models/version_check_Model.dart';
import 'apis.dart';

part 'network_api.g.dart';

@RestApi(baseUrl: Apis.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST(Apis.register)
  Future<AuthModel> registerRequest(@Body() body);

  @POST(Apis.login)
  Future<AuthModel> loginRequest(@Body() body);

  @POST(Apis.forgotPassword)
  Future<AuthModel> forgotPasswordRequest(@Body() body);

  @GET(Apis.getUserProfile)
  Future<AuthModel> getUserProfileRequest();

  @POST(Apis.editUserProfile)
  Future<AuthModel> editUserProfileRequest(@Body() body);

  @POST(Apis.changePassword)
  Future<AuthModel> changePasswordRequest(@Body() body);

  @GET(Apis.logout)
  Future<AuthModel> logoutRequest();

  @POST(Apis.versionChecker)
  Future<VersionCheckModel> versionCheckRequest(@Body() body);

  @GET(Apis.question)
  Future<QuestionModel> questionRequest();

  @GET(Apis.chapterList)
  Future<ChapterListModel> chapterListRequest();

  @POST(Apis.selectQuiz)
  Future<SelectedQuizModel> selectQuizRequest(@Body() body);

  @POST(Apis.fullQuiz)
  Future<FullQuizModel> fullQuizRequest(@Body() body);

  @POST(Apis.notificationFlag)
  Future<AuthModel> notificationFlagRequest(@Body() body);

  @POST(Apis.checkAbility)
  Future<AuthModel> checkAbilityRequest(@Body() body);
}

// flutter pub run build_runner build --delete-conflicting-outputs
