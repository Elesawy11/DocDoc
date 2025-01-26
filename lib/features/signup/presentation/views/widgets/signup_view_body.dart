import 'package:apointment_app/core/utils/spacer.dart';
import 'package:apointment_app/core/widgets/app_text_button.dart';
import 'package:apointment_app/features/login/presentation/views/widgets/terms_and_consdition_text.dart';
import 'package:apointment_app/features/signup/data/models/sign_up_request_model.dart';
import 'package:apointment_app/features/signup/presentation/manger/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              if (context
                  .read<SignUpCubit>()
                  .formKey
                  .currentState!
                  .validate()) {
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
    context.read<SignUpCubit>().signUp(
          signUpRequest: SignUpRequestModel(
            name: context.read<SignUpCubit>().nameController.text,
            email: context.read<SignUpCubit>().emailController.text,
            phone: context.read<SignUpCubit>().phoneController.text,
            password: context.read<SignUpCubit>().passwordController.text,
            passwordConfirmation:
                context.read<SignUpCubit>().passwordConfirmationController.text,
          ),
        );
  }
}
