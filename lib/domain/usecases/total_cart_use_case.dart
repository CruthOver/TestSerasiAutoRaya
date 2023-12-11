import 'package:test_serasi_raya/application/core/usecase/usecase_no_param.dart';
import 'package:test_serasi_raya/domain/repositories/cart_repository.dart';

class TotalCartUseCase extends UseCaseNoParam<int> {
  final CartRepository _repo;
  TotalCartUseCase(this._repo);
  @override
  Future<int> execute() {
    return _repo.getTotalCart();
  }
}
