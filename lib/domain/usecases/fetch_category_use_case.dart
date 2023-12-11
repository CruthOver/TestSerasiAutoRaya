import 'package:test_serasi_raya/application/core/usecase/usecase_no_param.dart';
import 'package:test_serasi_raya/domain/entities/response.dart';
import 'package:test_serasi_raya/domain/repositories/category_repository.dart';

class FetchCategoryUseCase extends UseCaseNoParam<BaseResponse<List<String>>> {
  final CategoryRepository _repo;
  FetchCategoryUseCase(this._repo);

  @override
  Future<BaseResponse<List<String>>> execute() {
    return _repo.getAllCategory();
  }
}
