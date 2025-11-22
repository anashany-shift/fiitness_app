import 'package:bloc_test/bloc_test.dart';
import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/domain/entities/responses/auth_entity/signup_entity_response.dart';
import 'package:fitness_app/domain/use_cases/auth/signup_use_case.dart';
import 'package:fitness_app/features/auth/sign_up/view_model/cubit/signup_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'signup_cubit_test.mocks.dart';

@GenerateMocks([SignupUseCase])
void main() {
  
  late MockSignupUseCase mockSignupUseCase;

  setUp(() {
    provideDummy<ApiResult<SignupEntityResponse>>(
        ApiSuccessResult(SignupEntityResponse(token: "dummy"))
    );
    mockSignupUseCase = MockSignupUseCase();
  });

  
  group("SignupCubit Tests", () {
    // test("should go to next page", () {
    //   cubit.goToNextPage();
    //   expect(cubit.state.pageIndex, 1);
    // });

 
    test("should toggle password visibility", () {
       final cubit = SignupCubit(mockSignupUseCase);
      expect(cubit.isvisiable.value, false);
      cubit.isPasswordVisible();
      expect(cubit.isvisiable.value, true);
    });

   
    blocTest<SignupCubit, SignupState>(
      "when signUp succeeds should emit loading then success state",
      build: () {
        final fakeResponse = SignupEntityResponse(
       
          token: "xxx",
        
        );

        when(mockSignupUseCase.call(signupRequest: anyNamed('signupRequest')))
            .thenAnswer((_) async => ApiSuccessResult(fakeResponse));

          return SignupCubit(mockSignupUseCase);
      },
      act: (cubit) {
        cubit.firstName.text = "Anas";
        cubit.lastName.text = "Hany";
        cubit.email.text = "anas@gmail.com";
        cubit.password.text = "123456";
        cubit.gender = "male";
        cubit.height = 170;
        cubit.weight = 75;
        cubit.age = 22;
        cubit.goal = "gain";
        cubit.activityLevel = "level1";

        cubit.signUp();
      },
      expect: () => [
        isA<SignupState>().having((s) => s.isLoading, "loading", true),
        isA<SignupState>()
            .having((s) => s.isLoading, "loading", false)
            .having((s) => s.signupEntityResponse, "data not null", isNotNull),
      ],
    );
    blocTest<SignupCubit, SignupState>(
      "when signUp fails should emit loading then error message",
      build: () {
        when(mockSignupUseCase.call(signupRequest: anyNamed('signupRequest')))
            .thenAnswer((_) async =>
                ApiErrorResult("Email already exists", ));

        return SignupCubit(mockSignupUseCase);
      },
      act: (cubit) {
        cubit.firstName.text = "Anas";
        cubit.lastName.text = "Hany";
        cubit.email.text = "anas@gmail.com";
        cubit.password.text = "123456";
        cubit.gender = "male";
        cubit.height = 170;
        cubit.weight = 75;
        cubit.age = 22;
        cubit.goal = "gain";
        cubit.activityLevel = "level1";

        cubit.signUp();
      },
      expect: () => [
        isA<SignupState>().having((s) => s.isLoading, "loading", true),
        isA<SignupState>()
            .having((s) => s.isLoading, "loading", false)
            .having((s) => s.errorMessage, "error", "Email already exists"),
      ],
    );
  });
}
