class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String urls = "192.168.101.4";
  // static const String baseUrl = "http://172.26.0.49:5000/api/";
  static const String baseUrl = "http://${urls}:5000/api/";
  // static const String baseUrl = "http://10.12.20.1:5000/api/";

  // ====================== Auth Routes ======================
  static const String login = "user/login";
  static const String register = "user/create";
  static const String getAllUser = "user/getAllUsers";
  static const String updateUser = "user/updateUser/";
  static const String deleteUser = "user/deleteUser/";
  static const String getAllProduct = "product/pagination";
  static const String imageUrl = "http://10.0.2.2:3000/uploads/";
  static const String uploadImage = "auth/uploadImage";
  static const String currentUser = "auth/getMe";
}
