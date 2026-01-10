import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/features/auth/login/view/widgets/login_view_body.dart';
import 'package:fitness_app/features/auth/login/view_model/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt.get<LoginCubit>(),
      child: SafeArea(
        child: Scaffold(resizeToAvoidBottomInset: false, body: LoginViewBody()),
      ),
    );
  }
}
