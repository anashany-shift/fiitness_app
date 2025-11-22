import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/api/models/requests/auth/signup_request.dart';
import 'package:fitness_app/domain/use_cases/auth/signup_use_case.dart';
import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/domain/entities/responses/auth_entity/signup_entity_response.dart';
import 'package:injectable/injectable.dart';

part 'signup_state.dart';
@injectable
class SignupCubit extends Cubit<SignupState> {
  final SignupUseCase signupUseCase;

  SignupCubit(this.signupUseCase)
      : super(SignupState(pageIndex: 0, isLoading: false));

  // Page controller
  final PageController pageController = PageController();
  int totalSteps = 6;

  void goToNextPage() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (state.pageIndex < totalSteps) {
      final newIndex = state.pageIndex + 1;
      pageController.jumpToPage(newIndex);
      emit(state.copyWith(pageIndex: newIndex));
    }
  }

  void goToBack() {
    if (state.pageIndex > 0) {
      final newIndex = state.pageIndex - 1;
      pageController.jumpToPage(newIndex);
      emit(state.copyWith(pageIndex: newIndex));
    }
  }
  void changePage(int index) {
  emit(state.copyWith(pageIndex: index));
}

  // Data from forms
 final TextEditingController firstName=TextEditingController();
 final TextEditingController lastName=TextEditingController();
 final TextEditingController email=TextEditingController();
 final TextEditingController password=TextEditingController();
  String? gender;
  int? height;
  int? weight;
  int? age;
  String? goal;
  String? activityLevel;
 final ValueNotifier <bool>isvisiable =ValueNotifier(false);

  void setGender(String v) => gender = v;
  void setGoal(String v) => goal = v;
  void setActivityLevel(String v) => activityLevel = v;
  void setAge(int v) => age = v;
  void setHeight(int v) => height = v;
  void setWeight(int v) => weight = v;
  void isPasswordVisible(){
    isvisiable.value =!isvisiable.value;
  }
  

  Future<void> signUp() async {
    emit(state.copyWith(isLoading: true));

    final req = SignUpRequest(
      firstName: firstName.text,
      lastName: lastName.text,
      email: email.text,
      password: password.text,
      rePassword: password.text,
      gender: gender!,
      height: height!,
      weight: weight!,
      age: age!,
      goal: goal!,
      activityLevel: activityLevel!,
    );

    final result = await signupUseCase.call(signupRequest: req);

    if (result is ApiSuccessResult<SignupEntityResponse>) {
      emit(state.copyWith(
        isLoading: false,
        signupEntityResponse: result.data,
      ));
    } else if (result is ApiErrorResult<SignupEntityResponse>) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: result.errorMessage,
      ));
    }
  }
  @override
  Future<void> close() {
    email.dispose();
    firstName.dispose();
    lastName.dispose();
    password.dispose();
    pageController.dispose();
    isvisiable.dispose();
    return super.close();
  }
  

}
