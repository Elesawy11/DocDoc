import 'package:apointment_app/core/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_onboarding_body.dart';
import 'custom_onboarding_title.dart';
import 'custom_text_and_button.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 32.w,
            ),
            child: Column(
              children: [
                verticalSpace(24),
                const CustomOnboardingTitle(),
                verticalSpace(40),
                const CustomOnboardingBody(),
                const CustomTextAndTextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
