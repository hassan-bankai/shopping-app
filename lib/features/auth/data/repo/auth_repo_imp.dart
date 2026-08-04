import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_app/core/network/handle_dio_exceptions_service.dart';
import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/features/auth/domain/entity/register_entity.dart';
import 'package:shopping_app/features/auth/domain/repo/auth_data_source_interface.dart';
import 'package:shopping_app/features/auth/domain/repo/auth_repo_interface.dart';

@Injectable(as: AuthRepoInterface)
class AuthRepoImp implements AuthRepoInterface {
  final AuthDataSourceInterface _authDataSource;
  AuthRepoImp(this._authDataSource);
  @override
  Future<ResultApi<String>> register(RegisterEntity entity) async {
    try {
      await _authDataSource.register(entity);
      return Success("Success");
    } on DioException catch (e) {
      return Error(HandleDioExceptionsService.handle(e));
    } catch (e) {
      return Error(e.toString());
    }
  }
}
