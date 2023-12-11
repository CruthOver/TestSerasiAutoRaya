import 'package:test_serasi_raya/domain/entities/response.dart';
import 'package:test_serasi_raya/domain/entities/user.dart';

abstract class AuthRepository {
  Future<BaseResponse<Map<String, dynamic>>> signIn(Map<String, dynamic> data);
  Future<BaseResponse<List<User>>> getAllUser();
}
