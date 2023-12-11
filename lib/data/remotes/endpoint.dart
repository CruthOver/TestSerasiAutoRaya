class EndPoint {
  static const String endPointLogin = "/auth/login";
  static const String endPointUser = "/users";
  static const String endPointProduct = "/products";
  static const String endPointSingleProduct = "/products/{product_id}";
  static const String endPointCategories = "/products/categories";
  static const String endPointProductByCategories =
      "/products/category/{category_name}";
  static const String endPointUserCart = "/carts/user/{user_id}";
}
