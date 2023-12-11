import 'package:test_serasi_raya/domain/entities/response.dart';

abstract class CategoryRepository {
  Future<BaseResponse<List<String>>> getAllCategory();
}
