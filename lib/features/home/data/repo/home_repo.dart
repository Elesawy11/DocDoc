import 'package:apointment_app/core/networking/api_error_handler.dart';
import 'package:apointment_app/core/networking/api_service.dart';
import 'package:apointment_app/features/home/data/models/doctor_model.dart';
import 'package:dartz/dartz.dart';


class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<Either<ErrorHandler, List<DoctorModel>>> getAllDoctor() async {
    try {
      var response = await _apiService.getAllDoctor();
      final list = List.from(response['data'])
          .map((e) => DoctorModel.fromJson(e))
          .toList();
      return right(list);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
