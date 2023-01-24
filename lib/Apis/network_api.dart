// ignore_for_file: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../Models/Auth_Model.dart';
import 'apis.dart';

part 'network_api.g.dart';

@RestApi(baseUrl: Apis.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST(Apis.register)
  Future<AuthModel> registerRequest(@Body() body);

}

// flutter pub run build_runner build --delete-conflicting-outputs
