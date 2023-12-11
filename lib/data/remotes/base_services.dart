import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:test_serasi_raya/application/config/app_constant.dart';
import 'package:test_serasi_raya/data/remotes/exception/app_exception.dart';
import 'package:test_serasi_raya/domain/entities/response.dart';

class BaseServices extends GetConnect {
  BaseServices() {
    baseUrl = App.baseUrl;
  }

  Future<BaseResponse> getData(String endPoint,
      {Map<String, dynamic>? query}) async {
    Response response = await get(
      endPoint,
    );
    debugPrint("Response ${response.bodyString}");
    debugPrint("URL Request ${response.request!.url}");
    return _handleResponse(response);
  }

  Future<BaseResponse> postData(String endPoint, Map<String, dynamic> data,
      {bool isFormData = false}) async {
    final dynamic data_;
    String contentType = httpClient.defaultContentType;
    if (isFormData) {
      contentType = 'multipart/form-data';
      data_ = FormData(data);
    } else {
      data_ = json.encode(data);
    }

    Response response = await post(endPoint, data_, contentType: contentType);

    debugPrint("Response : ${response.bodyString}");
    try {
      return _handleResponse(response);
    } catch (e) {
      return BaseResponse(
        data: null,
        success: false,
        message: response.statusText,
      );
    }
  }

  BaseResponse _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return BaseResponse(
          data: response.body, message: "Successfully", success: true);
    } else {
      String message = AppException.errorMessage(response);
      return BaseResponse(data: null, message: message, success: false);
    }
  }
}
