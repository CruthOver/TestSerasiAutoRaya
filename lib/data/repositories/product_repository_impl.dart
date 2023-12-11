import 'package:test_serasi_raya/data/models/product/product_model.dart';
import 'package:test_serasi_raya/data/remotes/services/product_service.dart';
import 'package:test_serasi_raya/domain/entities/product.dart';
import 'package:test_serasi_raya/domain/entities/response.dart';
import 'package:test_serasi_raya/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<BaseResponse<List<Product>>> getAllProduct(
      String? categoryName) async {
    final BaseResponse response;
    if (categoryName == null) {
      response = await ProductService.fetchAllProduct();
    } else {
      response = await ProductService.fetchProductByCategory(categoryName);
    }
    List<Product> data = <Product>[];
    if (response.success!) {
      data = List<Product>.from(
          response.data.map((x) => ProductModel.fromJson(x)));
    }
    return BaseResponse(
        data: data, message: response.message, success: response.success);
  }

  @override
  Future<BaseResponse<List<Product>>> getProductByCategory(
      String categoryName) async {
    final response = await ProductService.fetchProductByCategory(categoryName);
    List<Product> data = <Product>[];
    if (response.success!) {
      data = List<Product>.from(
          response.data.map((x) => ProductModel.fromJson(x)));
    }
    return BaseResponse(
        data: data, message: response.message, success: response.success);
  }

  @override
  Future<BaseResponse<Product>> getSingleProduct(int productId) async {
    final response = await ProductService.fetchSingleProduct(productId);
    Product data = Product();
    if (response.success!) {
      data = ProductModel.fromJson(response.data);
    }
    return BaseResponse(
        data: data, message: response.message, success: response.success);
  }
}
