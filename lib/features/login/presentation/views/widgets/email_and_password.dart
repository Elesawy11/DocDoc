import 'package:apointment_app/core/utils/service_locator.dart';
import 'package:apointment_app/features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/color.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class EmailAndPassowrd extends StatelessWidget {
  const EmailAndPassowrd({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = getIt.get<LoginCubit>();

    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: cubit.emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter valide email';
              }
            },
          ),
          verticalSpace(22),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return AppTextFormField(
                controller: cubit.passwordController,
                hintText: 'Password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter valide password';
                  }
                },
                isObscureText: cubit.isObscureText,
                suffixIcon: IconButton(
                  onPressed: () => cubit.toggleObscureText(),
                  icon: Icon(
                    cubit.isObscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: ColorManager.mainBlue,
                    size: 18.r,
                  ),
                ),
              );
            },
          ),
          verticalSpace(24),
        ],
      ),
    );
  }
}
