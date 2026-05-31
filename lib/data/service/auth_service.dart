import 'package:dio/dio.dart';
import 'package:flutterr/data/models/auth_model.dart';
import 'package:flutterr/data/service/api/api.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiService.baseUrl));
  Future<void> login(AuthModel loginData) async {
    print(
      "Login Data: Email: ${loginData.email}, Password: ${loginData.password}",
    );

    try {
      final response = await _dio.post(
        ApiService.login,
        data: {"email": loginData.email, "password": loginData.password},
      );
      print("Login Response: ${response.data}");
    } catch (e) {
      print("Login Error: $e");
    }
  }
}
