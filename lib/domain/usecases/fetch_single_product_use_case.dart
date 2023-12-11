import 'package:test_serasi_raya/application/core/usecase/usecase.dart';
import 'package:test_serasi_raya/domain/entities/product.dart';
import 'package:test_serasi_raya/domain/entities/response.dart';
import 'package:test_serasi_raya/domain/repositories/product_repository.dart';

class FetchSingleProductUseCase extends UseCase<BaseResponse<Product>, int> {
  final ProductRepository _repo;
  FetchSingleProductUseCase(this._repo);

  @override
  Future<BaseResponse<Product>> execute(int params) {
    return _repo.getSingleProduct(params);
  }
}
