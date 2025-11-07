import 'package:fitness_app/api/client/auth_api_client/auth_api_client.dart';
import 'package:fitness_app/api/data_source/auth/auth_remote_data_source_impl.dart';
import 'package:fitness_app/api/models/requests/auth/login_request.dart';
import 'package:fitness_app/api/models/responses/auth/login_response.dart';
import 'package:fitness_app/api/models/responses/auth/user_info_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_remote_data_source_test.mocks.dart';

@GenerateMocks([AuthApiClient])
void main() {
  test(
    "verify when call login from data source should send request and get response from api ",
    () async {
      MockAuthApiClient mockAuthApiClient = MockAuthApiClient();
      AuthRemoteDataSourceImpl authRemoteDataSourceImpl =
          AuthRemoteDataSourceImpl(mockAuthApiClient);
           var email = "anas1@gmail.com";
      var password = "Anas@123";

      var loginRequest = LoginRequest(
        email: email,
        password: password,
      );
      var expectedResponse = LoginResponse(
        message: "success",
        user: UserInfoDto(
          id: "success",
          firstName: "success",
          lastName: "success",
          email: email,
          gender: "success",
          age: 18,
          weight: 33,
          height: 33,
          activityLevel: "success",
          goal: "success",
          photo: "success",
          createdAt: "success",
        ),
        token: "token",
      );
      when(
        mockAuthApiClient.login(
          loginRequest
        ),
      ).thenAnswer((_) async => expectedResponse);
      var response = await authRemoteDataSourceImpl.login(
        loginRequest: loginRequest,
      );
      verify(
        mockAuthApiClient.login(
          loginRequest
        ),
      ).called(1);
      expect(response, equals(expectedResponse));

     
    },
  );
}
