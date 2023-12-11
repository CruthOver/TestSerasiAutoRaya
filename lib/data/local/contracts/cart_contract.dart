class CartContract {
  static const String tableName = "carts";
  static const String id = "id";
  static const String productId = "product_id";
  static const String productTitle = "product_title";
  static const String productImage = "product_image";
  static const String productPrice = "product_price";
  static const String quantity = "quantity";
  static const String date = "date";

  static const columnName = {
    id: "INTEGER PRIMARY KEY AUTOINCREMENT ",
    productId: "INTEGER ",
    productTitle: "TEXT ",
    productImage: 'TEXT ',
    productPrice: "REAL ",
    quantity: "INTEGER ",
    date: "INTEGER ",
  };
}
