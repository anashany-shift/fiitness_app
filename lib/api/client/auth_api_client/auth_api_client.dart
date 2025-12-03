import 'package:dio/dio.dart';
import 'package:fitness_app/api/models/requests/auth/login_request.dart';
import 'package:fitness_app/api/models/requests/auth/signup_request.dart';
import 'package:fitness_app/api/models/responses/auth/login_response.dart';
import 'package:fitness_app/api/models/responses/auth/signup_response.dart';
import 'package:fitness_app/api/models/responses/auth/user_info_dto.dart';
import 'package:fitness_app/api/models/responses/auth/user_response.dart';

import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/api_constant.dart';

part 'auth_api_client.g.dart';

@injectable 
@RestApi()
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(@Named("mainApi") Dio dio) = _AuthApiClient;

  @POST(ApiConstant.loginEndPoint)
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
  
  @POST(ApiConstant.signUpEndPoint)
  Future<SignupResponse> signUp(@Body() SignUpRequest signupRequest);


  @GET(ApiConstant.getLoggedUserData)
  Future<UserResponse> getLoggedUserData();

}
