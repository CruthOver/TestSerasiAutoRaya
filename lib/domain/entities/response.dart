class BaseResponse<T> {
  T? data;
  String? message;
  bool? success;

  BaseResponse({this.data, this.message, this.success});
}
