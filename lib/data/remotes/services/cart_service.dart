import 'package:test_serasi_raya/data/remotes/base_services.dart';
import 'package:test_serasi_raya/data/remotes/endpoint.dart';
import 'package:test_serasi_raya/domain/entities/response.dart';

class CartService extends BaseServices {
  Future<BaseResponse> fetchUserCart(int userId) async {
    return await getData(
        EndPoint.endPointUserCart.replaceAll("{user_id}", userId.toString()));
  }
}
