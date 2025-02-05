import 'package:apointment_app/core/utils/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/color.dart';
import '../utils/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final Widget? prefixIcon;
  final int? maxLines;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.prefixIcon,
    this.maxLines = 1,
    this.onTap,
    this.onTapOutside,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: onTapOutside,
      onTap: onTap,
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          focusedBorder: focusedBorder ??
              outLineBorder(
                color: ColorManager.mainBlue,
              ),
          enabledBorder: enabledBorder ??
              outLineBorder(
                color: ColorManager.grayED,
              ),
          errorBorder: outLineBorder(
            color: Colors.red,
          ),
          focusedErrorBorder: outLineBorder(
            color: Colors.red,
          ),
          hintStyle: hintStyle ??
              Styles.font14Regular.copyWith(
                color: ColorManager.grayC2,
              ),
          hintText: hintText,
          suffixIcon: suffixIcon,
          fillColor: backgroundColor ?? ColorManager.grayFD,
          filled: true,
          prefixIcon: prefixIcon),
      obscureText: isObscureText ?? false,
      style: Styles.font14Regular.copyWith(
        fontWeight: FontWeightHelper.medium,
        color: ColorManager.darkBlue,
      ),
      validator: (value) {
        return validator(value);
      },
    );
  }

  OutlineInputBorder outLineBorder({required Color color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 1.3,
      ),
      borderRadius: BorderRadius.circular(16.0.r),
    );
  }
}
