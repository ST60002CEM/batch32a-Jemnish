class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://10.0.2.2:5000/api/";

  // ====================== Auth Routes ======================
  static const String login = "auth/login";
  static const String register = "auth/create";
  static const String getAllUser = "auth/getAllUsers";
  static const String updateUser = "auth/updateUser/";
  static const String deleteUser = "auth/deleteUser/";
  static const String imageUrl = "http://10.0.2.2:3000/uploads/";
  static const String uploadImage = "auth/uploadImage";
  static const String currentUser = "auth/getMe";


}
