import 'package:test_serasi_raya/application/core/usecase/usecase.dart';
import 'package:test_serasi_raya/domain/entities/product.dart';
import 'package:test_serasi_raya/domain/entities/response.dart';
import 'package:test_serasi_raya/domain/repositories/product_repository.dart';

class FetchProductByCategoryUseCase
    extends UseCase<BaseResponse<List<Product>>, String> {
  final ProductRepository _repo;
  FetchProductByCategoryUseCase(this._repo);

  @override
  Future<BaseResponse<List<Product>>> execute(String params) {
    return _repo.getProductByCategory(params);
  }
}
