import 'package:apointment_app/core/routing/routes.dart';
import 'package:apointment_app/core/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/color.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/app_text_button.dart';

class CustomTextAndTextButton extends StatelessWidget {
  const CustomTextAndTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
          style: Styles.font12Regular.copyWith(
            color: ColorManager.grey75,
          ),
          textAlign: TextAlign.center,
        ),
        verticalSpace(32),
        AppTextButton(
          text: 'Get Started',
          onPressed: () {
            context.go(Routes.loginView);
          },
        ),
        verticalSpace(32),
      ],
    );
  }
}
