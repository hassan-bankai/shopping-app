import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/features/auth/domain/entity/register_entity.dart';

abstract interface class AuthDataSourceInterface {
  Future<ResultApi<String>> register(RegisterEntity entity);
}
