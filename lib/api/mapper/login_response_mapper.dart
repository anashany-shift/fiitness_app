import 'package:fitness_app/api/models/responses/auth/login_response.dart';
import 'package:fitness_app/domain/entities/responses/auth_entity/login_entity.dart';

extension LoginResponseMapper on LoginResponse {
  LoginEntity toEntity() {
    return LoginEntity(
      token: token,
    );
  }
}