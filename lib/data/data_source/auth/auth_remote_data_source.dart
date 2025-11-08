import 'package:fitness_app/api/models/requests/auth/login_request.dart';
import 'package:fitness_app/api/models/responses/auth/login_response.dart';

abstract class AuthRemoteDataSource {

Future<LoginResponse>login({required LoginRequest loginRequest});

}