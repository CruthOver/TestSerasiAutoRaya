import 'package:test_serasi_raya/application/core/usecase/usecase.dart';
import 'package:test_serasi_raya/domain/repositories/cart_repository.dart';

class DeleteCartUseCase extends UseCase<bool, int> {
  final CartRepository _repo;
  DeleteCartUseCase(this._repo);
  @override
  Future<bool> execute(int params) {
    return _repo.deleteCart(params);
  }
}
