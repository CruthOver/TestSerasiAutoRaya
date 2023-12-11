import 'package:test_serasi_raya/application/core/usecase/usecase.dart';
import 'package:test_serasi_raya/data/models/cart/cart_model.dart';
import 'package:test_serasi_raya/domain/repositories/cart_repository.dart';

class UpdateCartUserCase extends UseCase<int, CartModel> {
  final CartRepository _repo;
  UpdateCartUserCase(this._repo);

  @override
  Future<int> execute(CartModel params) {
    return _repo.updateCart(params);
  }
}
