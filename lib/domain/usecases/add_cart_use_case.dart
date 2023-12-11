import 'package:test_serasi_raya/application/core/usecase/usecase.dart';
import 'package:test_serasi_raya/data/models/cart/cart_model.dart';
import 'package:test_serasi_raya/domain/entities/cart.dart';
import 'package:test_serasi_raya/domain/repositories/cart_repository.dart';

class AddCartUserCase extends UseCase<int, CartModel> {
  final CartRepository _repo;
  AddCartUserCase(this._repo);
  @override
  Future<int> execute(CartModel params) {
    return _repo.addToCart(params);
  }
}
