import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_app/core/network/api_constants.dart';
import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/features/auth/data/model/register_dto.dart';
import 'package:shopping_app/features/auth/domain/entity/register_entity.dart';
import 'package:shopping_app/features/auth/domain/repo/auth_data_source_interface.dart';

@Injectable(as: AuthDataSourceInterface)
class AuthDataSourceImp implements AuthDataSourceInterface {
  final Dio _dio;
  AuthDataSourceImp(this._dio);
  @override
  Future<ResultApi<String>> register(RegisterEntity entity) async {
    var request = RegisterDto(
      name: entity.userName,
      phone: entity.phoneNumber,
      email: entity.email,
      password: entity.password,
      confirmPassword: entity.confirmPassword,
    );
    try {
      final response = await _dio.post(
        ApiConstants.signUp,
        data: request.toJson(),
        options: Options(headers: ApiConstants.headers),
      );
      if (response.statusCode == 200) {
        return Success<String>(response.data["message"]);
      }
      return Error<String>("Error");
    } catch (e) {
      return Error<String>(e.toString());
    }
  }
}
