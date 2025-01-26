import 'package:apointment_app/core/utils/service_locator.dart';
import 'package:apointment_app/core/utils/spacer.dart';
import 'package:apointment_app/core/widgets/app_text_button.dart';
import 'package:apointment_app/features/login/presentation/views/widgets/terms_and_consdition_text.dart';
import 'package:apointment_app/features/signup/data/models/sign_up_request_model.dart';
import 'package:apointment_app/features/signup/presentation/manger/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'already_have_account.dart';
import 'sign_up_bloc_listener.dart';
import 'sign_up_forms_text.dart';
import 'welcome_sing_up_widget.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const WelcomeSignUpWidget(),
          verticalSpace(16),
          const SignUpFormsText(),
          verticalSpace(32),
          AppTextButton(
            text: 'Create Account',
            onPressed: () {
              if (getIt.get<SignUpCubit>().formKey.currentState!.validate()) {
                signUpMethod(context);
              }
            },
          ),
          verticalSpace(60),
          const TermsAndConditionText(),
          verticalSpace(18),
          const AlreadyHaveAnAccount(),
          verticalSpace(12),
          const SignUpBlocListener(),
        ],
      ),
    );
  }

  void signUpMethod(BuildContext context) {
    getIt.get<SignUpCubit>().signUp(
          signUpRequest: SignUpRequestModel(
            name: getIt.get<SignUpCubit>().nameController.text,
            email: getIt.get<SignUpCubit>().emailController.text,
            phone: getIt.get<SignUpCubit>().phoneController.text,
            password: getIt.get<SignUpCubit>().passwordController.text,
            passwordConfirmation:
                getIt.get<SignUpCubit>().passwordConfirmationController.text,
          ),
        );
  }
}
