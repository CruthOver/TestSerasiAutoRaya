import 'package:test_serasi_raya/application/core/usecase/usecase_no_param.dart';
import 'package:test_serasi_raya/domain/repositories/cart_repository.dart';

class DeleteAllCartUseCase extends UseCaseNoParam<bool> {
  final CartRepository _repo;
  DeleteAllCartUseCase(this._repo);

  @override
  Future<bool> execute() {
    return _repo.clearCart();
  }
}
