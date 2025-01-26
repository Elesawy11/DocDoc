import 'package:flutter/material.dart';
import '../../../home/data/models/doctor_model.dart';
import 'widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.doctorList});
  final List<DoctorModel> doctorList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SearchViewBody(
          doctorList: doctorList,
        ),
      ),
    );
  }
}
