import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';

class ApiResponse {
  String message;
  dynamic data;
  bool status;
  int resStatuscode;

  ApiResponse({
    required this.message,
    required this.status,
    required this.data,
    required this.resStatuscode,
  });

  factory ApiResponse.success(data) {
    return ApiResponse(
      message: "success",
      status: true,
      data: data,
      resStatuscode: 200,
    );
  }

  factory ApiResponse.failed(String message) {
    return ApiResponse(
      message: message,
      status: false,
      data: null,
      resStatuscode: 500,
    );
  }
}

// ================================ ApiService-----------------
class ApiService {
  late Dio dio;
  PersistCookieJar? cookieJar;

  ApiService(String baseUrl) {
    print("base Url : $baseUrl");
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 90),
        receiveTimeout: const Duration(seconds: 90),
        headers: {
          "Content-Type": "application/json;charset=UTF-8",
          "accept": "application/json",
        },
      ),
    );
  }

  Future<void> ensureCookieJar() async {
    if (cookieJar == null) {
      final dir = await getApplicationDocumentsDirectory();
      cookieJar = PersistCookieJar(
        storage: FileStorage(dir.path),
        ignoreExpires: false,
      );
      dio.interceptors.add(CookieManager(cookieJar!));
      print("✅ CookieManager initialized");
    }
  }

  Future<bool> hasToken() async {
    await ensureCookieJar();
    final cookies = await cookieJar!.loadForRequest(
      Uri.parse(dio.options.baseUrl),
    );
    print("Cookies loaded: $cookies"); // debug
    return cookies.any(
      (cookie) => cookie.name == "token" && cookie.value.isNotEmpty,
    );
  }

   /// Completely resets Dio instance – removes baseUrl, cookies, and interceptors
  void resetDio() {
    // 1. Clear any existing interceptors (especially CookieManager)
    dio.interceptors.clear();

    // 2. Create a brand new Dio instance with EMPTY baseUrl
    dio = Dio(
      BaseOptions(
        baseUrl: "", // Important: No base URL after logout
        connectTimeout: const Duration(seconds: 90),
        receiveTimeout: const Duration(seconds: 90),
        headers: {
          "Content-Type": "application/json;charset=UTF-8",
          "accept": "application/json",
        },
      ),
    );

    // 3. Delete persistent cookies from disk
    if (cookieJar != null) {
      cookieJar!.deleteAll(); // removes all saved cookies
    }

    // 4. Null out the cookie jar reference
    cookieJar = null;

    print("Dio fully reset – baseUrl cleared, cookies deleted, interceptors removed");
  }

  /// Optional: Extra method to just clear cookies (useful separately)
  Future<void> clearAllCookies() async {
    if (cookieJar != null) {
      await cookieJar!.deleteAll();
      print("All persistent cookies deleted from storage");
    }
  }

  Future<Response> postCookies(String endpoint, Map body) async {
    if (cookieJar == null) await ensureCookieJar();
    return await dio.post(endpoint, data: body);
  }

  Future<ApiResponse> postMethod(String endpoint, Map body) async {
    try {
      if (cookieJar == null) await ensureCookieJar(); // 👈 ensure cookies ready
      final response = await dio.post(endpoint, data: body);
      print("Login headers: ${response.headers}");
      return ApiResponse.success(response.data);
    } catch (e) {
      return ApiResponse.failed(e.toString());
    }
  }

  Future<ApiResponse> getMethod(String endpoint) async {
    try {
      await ensureCookieJar();
      final response = await dio.get(endpoint);
      return ApiResponse.success(response.data);
    } catch (e) {
      return ApiResponse.failed(e.toString());
    }
  }
}