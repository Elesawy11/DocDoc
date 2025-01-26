import 'package:flutter/material.dart';
import 'widgets/speciality_view_body.dart';

class SpecialityView extends StatelessWidget {
  const SpecialityView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SpecialityViewBody(),
      ),
    );
  }
}
