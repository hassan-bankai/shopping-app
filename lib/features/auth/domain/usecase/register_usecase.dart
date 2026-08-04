import 'package:injectable/injectable.dart';
import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/features/auth/domain/entity/register_entity.dart';
import 'package:shopping_app/features/auth/domain/repo/auth_data_source_interface.dart';

@injectable
class RegisterUseCase {
  RegisterUseCase(this._authDataSourceInterface);
  final AuthDataSourceInterface _authDataSourceInterface;

  Future<ResultApi<String>> invoke(RegisterEntity entity) async {
    return await _authDataSourceInterface.register(entity);
  }
}
