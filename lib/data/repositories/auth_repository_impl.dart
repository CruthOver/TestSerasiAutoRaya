import 'package:test_serasi_raya/data/models/user/user_model.dart';
import 'package:test_serasi_raya/data/remotes/services/auth_service.dart';
import 'package:test_serasi_raya/domain/entities/response.dart';
import 'package:test_serasi_raya/domain/entities/user.dart';
import 'package:test_serasi_raya/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<BaseResponse<Map<String, dynamic>>> signIn(
      Map<String, dynamic> data) async {
    final response = await AuthService().signIn(data);
    return BaseResponse<Map<String, dynamic>>(
        data: response.data,
        message: response.message,
        success: response.success);
  }

  @override
  Future<BaseResponse<List<User>>> getAllUser() async {
    final response = await AuthService().getAllUser();
    return BaseResponse<List<User>>(
        data: List<User>.from(response.data.map((e) => UserModel.fromJson(e))),
        message: response.message,
        success: response.success);
  }
}
