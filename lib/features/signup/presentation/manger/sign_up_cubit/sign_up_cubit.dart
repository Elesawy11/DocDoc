import 'package:apointment_app/core/utils/api_keys.dart';
import 'package:apointment_app/core/utils/service_locator.dart';
import 'package:apointment_app/features/signup/data/models/sign_up_request_model.dart';
import 'package:apointment_app/features/signup/data/models/sign_up_response_model.dart';
import 'package:apointment_app/features/signup/data/repo/sign_up_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());
  final SignUpRepo signUpRepo;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();
  Future<void> signUp({required SignUpRequestModel signUpRequest}) async {
    emit(SignUpLoading());

    var response = await signUpRepo.signUp(signUpRequest: signUpRequest);

    response.fold(
        (failure) => emit(
              SignUpFailure(failure.apiErrorModel.message ?? 'UnKnowen Error'),
            ), (signUpResponseModel) {
      getIt.get<ApiKeys>().token = signUpResponseModel.userData!.token;
      emit(
        SignUpSuccess(signUpResponseModel),
      );
    });
  }
}
