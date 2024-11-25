class AppLink {
  static const String server = "http://192.168.1.102/ecommerce";
  static const String imagestatic = "http://192.168.1.102/ecommerce/upload";
  static const String imageCategories = "$imagestatic/categories";
  static const String imageItems = "$imagestatic/items";
  //==================================================//
  static const String test = "$server/test.php";
  static const String notification = "$server/notification.php";

  // =======================Auth======================= //

  static const String login = "$server/admin/auth/login.php";

  // ===============================forgetpassword==================//

  static const String checkEmail =
      "$server/admin/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/admin/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/admin/forgetpassword/verifycode.php";

  // ====================home

  static const String homepage = "$server/home.php";

  // ==================Orders

  static const String viewpendingOrders = "$server/delivery/orders/pending.php";
  static const String viewacceptedOrders =
      "$server/delivery/orders/accepted.php";
  static const String approveOrders = "$server/delivery/orders/approve.php";
  static const String viewarchiveOrders = "$server/delivery/orders/archive.php";
  static const String detailsOrders = "$server/delivery/orders/details.php";
  static const String doneOrders = "$server/delivery/orders/done.php";
  // ==================categories

  static const String categoriesview = "$server/admin/categories/view.php";
  static const String categoriesadd = "$server/admin/categories/add.php";
  static const String categoriesedit = "$server/admin/categories/edit.php";
  static const String categoriesdelete = "$server/admin/categories/delete.php";

  // ==================items
  static const String itemsview = "$server/admin/items/view.php";
  static const String itemsadd = "$server/admin/items/add.php";
  static const String itemsedit = "$server/admin/items/edit.php";
  static const String itemsdelete = "$server/admin/items/delete.php";
}
