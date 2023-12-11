import 'package:test_serasi_raya/data/remotes/base_services.dart';
import 'package:test_serasi_raya/data/remotes/endpoint.dart';
import 'package:test_serasi_raya/domain/entities/response.dart';

class AuthService extends BaseServices {
  Future<BaseResponse> signIn(Map<String, dynamic> data) async {
    return await postData(EndPoint.endPointLogin, data);
  }

  Future<BaseResponse> getAllUser() async {
    return await getData(EndPoint.endPointUser);
  }
}
