import 'package:test_serasi_raya/application/core/usecase/usecase_no_param.dart';
import 'package:test_serasi_raya/domain/entities/response.dart';
import 'package:test_serasi_raya/domain/entities/user.dart';
import 'package:test_serasi_raya/domain/repositories/auth_repository.dart';

class FetchUserUseCase extends UseCaseNoParam<BaseResponse<List<User>>> {
  final AuthRepository _repo;
  FetchUserUseCase(this._repo);
  @override
  Future<BaseResponse<List<User>>> execute() {
    return _repo.getAllUser();
  }
}
