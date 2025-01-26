import 'package:apointment_app/core/utils/api_keys.dart';
import 'package:apointment_app/core/utils/service_locator.dart';
import 'package:apointment_app/features/login/data/models/login_request.dart';
import 'package:apointment_app/features/login/data/models/login_response.dart';
import 'package:apointment_app/features/login/data/repo/login_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  Future<void> loginMethod(LoginRequestBody loginRequest) async {
    emit(LoginLoading());

    var response = await loginRepo.login(loginRequest);

    response.fold(
      (failure) =>
          emit(LoginFailure(failure.apiErrorModel.message ?? 'unKnowen error')),
      (responseBody) async {
        getIt.get<ApiKeys>().token = responseBody.userData!.token;

        emit(
          LoginSuccess(
            responseBody,
          ),
        );
      },
    );
  }

  void toggleObscureText() {
    isObscureText = !isObscureText;
    emit(LoginObscureText(isObscureText));
  }
}
