import 'package:test_serasi_raya/domain/entities/product.dart';
import 'package:test_serasi_raya/domain/entities/response.dart';

abstract class ProductRepository {
  Future<BaseResponse<List<Product>>> getAllProduct(String? categoryName);
  Future<BaseResponse<Product>> getSingleProduct(int productId);
  Future<BaseResponse<List<Product>>> getProductByCategory(String categoryName);
}
