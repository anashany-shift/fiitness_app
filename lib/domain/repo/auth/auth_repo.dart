import 'package:fitness_app/api/models/requests/auth/login_request.dart';
import 'package:fitness_app/api/models/requests/auth/signup_request.dart';
import 'package:fitness_app/api/models/responses/auth/logout_response.dart';
import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/domain/entities/responses/auth_entity/login_entity.dart';
import 'package:fitness_app/domain/entities/responses/auth_entity/signup_entity_response.dart';
import 'package:fitness_app/domain/entities/responses/auth_entity/user_info_entity.dart';

abstract class AuthRepo {
  Future<ApiResult<LoginEntity>> login({required LoginRequest loginRequest});
  Future<ApiResult<SignupEntityResponse>> signUp({required SignUpRequest signupRequest});
  Future<ApiResult<UserInfoEntity>> getLoggedUserData();
  Future<ApiResult<LogoutResponse>>logout();
}