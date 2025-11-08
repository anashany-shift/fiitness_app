import 'package:fitness_app/api/client/auth_api_client/auth_api_client.dart';
import 'package:fitness_app/api/models/requests/auth/login_request.dart';
import 'package:fitness_app/api/models/responses/auth/login_response.dart';
import 'package:fitness_app/data/data_source/auth/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiClient authApiClient;

  AuthRemoteDataSourceImpl(this.authApiClient);

  @override
  Future<LoginResponse> login({required LoginRequest loginRequest}) async {
    return await authApiClient.login(loginRequest);
  }
}
