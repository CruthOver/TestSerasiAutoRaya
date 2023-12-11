import 'package:test_serasi_raya/application/core/usecase/usecase_no_param.dart';
import 'package:test_serasi_raya/domain/entities/cart.dart';
import 'package:test_serasi_raya/domain/repositories/cart_repository.dart';

class FetchUserCartUseCase extends UseCaseNoParam<List<Cart>> {
  final CartRepository _repo;
  FetchUserCartUseCase(this._repo);
  @override
  Future<List<Cart>> execute() {
    return _repo.getUserCart();
  }
}
