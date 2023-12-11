import 'package:test_serasi_raya/data/remotes/base_services.dart';
import 'package:test_serasi_raya/data/remotes/endpoint.dart';
import 'package:test_serasi_raya/domain/entities/response.dart';

class CategoryService extends BaseServices {
  Future<BaseResponse> fetchAllCategory() async {
    return await getData(EndPoint.endPointCategories);
  }
}
