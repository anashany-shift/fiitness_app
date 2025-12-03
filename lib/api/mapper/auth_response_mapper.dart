import 'package:fitness_app/api/models/responses/auth/login_response.dart';
import 'package:fitness_app/api/models/responses/auth/signup_response.dart';
import 'package:fitness_app/api/models/responses/auth/user_response.dart';
import 'package:fitness_app/domain/entities/responses/auth_entity/login_entity.dart';
import 'package:fitness_app/domain/entities/responses/auth_entity/signup_entity_response.dart';
import 'package:fitness_app/domain/entities/responses/auth_entity/user_info_entity.dart';

extension LoginResponseMapper on LoginResponse {
  LoginEntity toEntity() {
    return LoginEntity(token: token);
  }
}

extension SignUPResponseMapper on SignupResponse {
  SignupEntityResponse toEntity() {
    return SignupEntityResponse(token: token);
  }
}

extension UserInfoDtoMapper on UserResponse {
  UserInfoEntity toEntity() {
    return UserInfoEntity(
      id: user?.id,
      firstName: user?.firstName,
      lastName: user?.lastName,
      email: user?.email,
      photo: user?.photo,
      activityLevel: user?.activityLevel,
      goal: user?.goal,
      age: user?.age,
      height: user?.height,
      weight: user?.weight,
      gender: user?.gender,
    );
  }
}
