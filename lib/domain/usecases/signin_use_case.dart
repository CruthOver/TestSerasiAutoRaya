import 'package:test_serasi_raya/application/core/usecase/usecase.dart';
import 'package:test_serasi_raya/domain/entities/response.dart';
import 'package:test_serasi_raya/domain/repositories/auth_repository.dart';

class FetchSignInUseCase
    extends UseCase<BaseResponse<Map<String, dynamic>>, Map<String, dynamic>> {
  final AuthRepository _repo;
  FetchSignInUseCase(this._repo);
  @override
  Future<BaseResponse<Map<String, dynamic>>> execute(
      Map<String, dynamic> params) {
    return _repo.signIn(params);
  }
}
