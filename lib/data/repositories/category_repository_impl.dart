import 'package:test_serasi_raya/data/remotes/services/category_service.dart';
import 'package:test_serasi_raya/domain/entities/response.dart';
import 'package:test_serasi_raya/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<BaseResponse<List<String>>> getAllCategory() async {
    final response = await CategoryService().fetchAllCategory();
    return BaseResponse<List<String>>(
        data: response.data != null
            ? List<String>.from(response.data.map((e) => e))
            : [],
        message: response.message,
        success: response.success);
  }
}
