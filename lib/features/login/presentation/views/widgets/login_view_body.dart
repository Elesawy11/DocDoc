import 'package:apointment_app/core/utils/color.dart';
import 'package:apointment_app/core/utils/service_locator.dart';
import 'package:apointment_app/core/utils/spacer.dart';
import 'package:apointment_app/core/utils/styles.dart';
import 'package:apointment_app/core/widgets/app_text_button.dart';
import 'package:apointment_app/features/login/data/models/login_request.dart';
import 'package:apointment_app/features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:apointment_app/features/login/presentation/views/widgets/divider_and_text.dart';
import 'package:apointment_app/features/login/presentation/views/widgets/email_and_password.dart';
import 'package:apointment_app/features/login/presentation/views/widgets/login_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_text_widget.dart';
import 'terms_and_consdition_text.dart';
import 'welcome_login_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<LoginCubit>(),
      child: Builder(builder: (context) {
        LoginCubit cubit = getIt.get<LoginCubit>();
        return SingleChildScrollView(
          child: Column(
            children: [
              const WelcomeLoginWidget(),
              verticalSpace(36),
              const EmailAndPassowrd(),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password?',
                  style: Styles.font12Regular.copyWith(
                    color: ColorManager.mainBlue,
                  ),
                ),
              ),
              verticalSpace(32),
              AppTextButton(
                text: 'Login',
                onPressed: () {
                  // context.push(Routes.homeView);
                  if (getIt
                      .get<LoginCubit>()
                      .formKey
                      .currentState!
                      .validate()) {
                    getIt.get<LoginCubit>().loginMethod(
                          LoginRequestBody(
                            email: getIt.get<LoginCubit>().emailController.text,
                            password:
                                getIt.get<LoginCubit>().passwordController.text,
                          ),
                        );
                  }
                },
              ),
              verticalSpace(46),
              const DividerAndText(),
              verticalSpace(60),
              const TermsAndConditionText(),
              verticalSpace(18),
              const SignUpTextWidget(),
              verticalSpace(12),
              LoginBlocListener(bloc: cubit)
            ],
          ),
        );
      }),
    );
  }
}
