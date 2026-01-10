import 'package:fitness_app/api/models/requests/auth/login_request.dart';
import 'package:fitness_app/api/models/requests/auth/signup_request.dart';
import 'package:fitness_app/api/models/responses/auth/login_response.dart';
import 'package:fitness_app/api/models/responses/auth/logout_response.dart';
import 'package:fitness_app/api/models/responses/auth/signup_response.dart';
import 'package:fitness_app/api/models/responses/auth/user_response.dart';

abstract class AuthRemoteDataSource {

Future<LoginResponse>login({required LoginRequest loginRequest});
Future<SignupResponse>signUp({required SignUpRequest signupRequest});

  Future<UserResponse> getLoggedUserData();
Future<LogoutResponse>logout();

}