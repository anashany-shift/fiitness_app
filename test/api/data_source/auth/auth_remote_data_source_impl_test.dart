import 'dart:math';

import 'package:fitness_app/api/data_source/auth/auth_remote_data_source_impl.dart';
import 'package:fitness_app/api/models/responses/auth/user_info_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:fitness_app/api/models/requests/auth/login_request.dart';
import 'package:fitness_app/api/models/requests/auth/signup_request.dart';
import 'package:fitness_app/api/models/responses/auth/login_response.dart';
import 'package:fitness_app/api/models/responses/auth/signup_response.dart';

import '../../../data/data_source/auth/auth_remote_data_source_test.mocks.dart';

void main() {
  late MockAuthApiClient mockAuthApiClient;
  late AuthRemoteDataSourceImpl dataSourceimpl;

  setUp(() {
    mockAuthApiClient = MockAuthApiClient();
    dataSourceimpl = AuthRemoteDataSourceImpl(mockAuthApiClient);
  });

  group("Login tests", () {
    test("should call login on api client and return response", () async {
      // Arrange

      var email = "anas1@gmail.com";
      var password = "Anas@123";

      final loginRequest = LoginRequest(email: email, password: password);

      final expectedLoginResponse = LoginResponse(
        token: "abc",
        user: UserInfoDto(
          id: "1",
          firstName: "Anas",
          lastName: "Hany",
          email: loginRequest.email,
          gender: "male",
          activityLevel: "level1",
          age: 33,
          createdAt: "vewve",
          goal: "gain",
          height: 114,
          photo: "vgew",
          weight: 30,
        ),
        message: "success",
      );

      when(
        mockAuthApiClient.login(loginRequest),
      ).thenAnswer((_) async => expectedLoginResponse);

      // Act
      final result = await dataSourceimpl.login(loginRequest: loginRequest);
      verify(mockAuthApiClient.login(loginRequest)).called(1);

      // Assert
      expect(result, isA<LoginResponse>());
      expect(result.token, "abc");
    });

    test(
      "when write invalid email should return invalid email or password",
      () {
        var email = "anas1@gmail.om";
        var password = "Anas@123";

        final loginRequest = LoginRequest(email: email, password: password);
        when(
          mockAuthApiClient.login(loginRequest),
        ).thenAnswer((_) async => throw Exception("Invalid email or password"));
        final result = dataSourceimpl.login(loginRequest: loginRequest);
        verify(mockAuthApiClient.login(loginRequest)).called(1);
        expect(result, throwsA(isA<Exception>()));
      },
    );
  });

  group("SignUp test", () {
    test(
      "when call signup from datasource should call from api client and return response ",
      () async{
        //arrange
        var email = "anas1@gmail";
        var password = "breer33@12";
        final signupRequest = SignUpRequest(
          firstName: "Anas",
          lastName: "Hany",
          email: email,
          password: password,
          activityLevel: "level1",
          age: 33,
          gender: "male",
          goal: "gain",
          height: 114,
          weight: 30,
          rePassword: password,
        );
        final expectedSignupResponse = SignupResponse(
         message: "success",
         user: UserInfoDto(
          id: "1",
          firstName: "Anas",
          lastName: "Hany",
          email: signupRequest.email,
          gender: "male",
          activityLevel: "level1",
          age: 33,
          createdAt: "vewve",
          goal: "gain",
          height: 114,
          photo: "vgew",
          weight: 30,
        ),
        token: "abc",

        );

        when(
          mockAuthApiClient.signUp(signupRequest),
        ).thenAnswer((_) async => expectedSignupResponse);

        //assert
        final result =await dataSourceimpl.signUp(signupRequest: signupRequest);
        verify(mockAuthApiClient.signUp(signupRequest)).called(1);

        expect(result, equals( expectedSignupResponse));
      },
    );
  });
}
