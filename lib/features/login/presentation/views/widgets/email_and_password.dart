import 'package:apointment_app/core/utils/app_regex.dart';
import 'package:apointment_app/core/utils/service_locator.dart';
import 'package:apointment_app/features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/color.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import 'password_validation.dart';

class EmailAndPassowrd extends StatefulWidget {
  const EmailAndPassowrd({super.key});

  @override
  State<EmailAndPassowrd> createState() => _EmailAndPassowrdState();
}

class _EmailAndPassowrdState extends State<EmailAndPassowrd> {
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  bool isObscureText = true;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();

    passwordController = getIt.get<LoginCubit>().passwordController;
    setupPassowrdControllerListener();
  }

  void setupPassowrdControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(
            getIt.get<LoginCubit>().passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(
            getIt.get<LoginCubit>().passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
            getIt.get<LoginCubit>().passwordController.text);
        hasNumber =
            AppRegex.hasNumber(getIt.get<LoginCubit>().passwordController.text);
        hasMinLength = AppRegex.hasMinLength(
            getIt.get<LoginCubit>().passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: getIt.get<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: getIt.get<LoginCubit>().emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'please enter valide email';
              }
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: getIt.get<LoginCubit>().passwordController,
            hintText: 'Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter valide password';
              }
            },
            isObscureText: isObscureText,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              icon: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: ColorManager.mainBlue,
                size: 18.r,
              ),
            ),
          ),
          verticalSpace(24),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
