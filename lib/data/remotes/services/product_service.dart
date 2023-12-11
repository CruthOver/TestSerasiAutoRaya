import 'package:test_serasi_raya/data/remotes/base_services.dart';
import 'package:test_serasi_raya/data/remotes/endpoint.dart';
import 'package:test_serasi_raya/domain/entities/response.dart';

class ProductService {
  static BaseServices services = BaseServices();
  static Future<BaseResponse> fetchAllProduct() async {
    return await services.getData(EndPoint.endPointProduct);
  }

  static Future<BaseResponse> fetchSingleProduct(int productId) async {
    return await services.getData(EndPoint.endPointSingleProduct
        .replaceAll("{product_id}", productId.toString()));
  }

  static Future<BaseResponse> fetchProductByCategory(
      String categoryName) async {
    return await services.getData(EndPoint.endPointProductByCategories
        .replaceAll("{category_name}", categoryName));
  }
}
