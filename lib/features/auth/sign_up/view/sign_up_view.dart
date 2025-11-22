import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/sign_up_view_body.dart';
import 'package:fitness_app/features/auth/sign_up/view_model/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SignupCubit>(),
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        body: SafeArea(child: SignUpViewBody())),
    );
  }
}
