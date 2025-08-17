import 'package:cinebox/cinebox_main_app.dart';
import 'package:cinebox/config/env.dart';
import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/services/services_providers.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'backend_rest_client_provider.g.dart';

class BackendAuthInterceptor extends Interceptor {
  final Ref ref;

  BackendAuthInterceptor({required this.ref});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final localStorage = ref.read(localStorageServiceProvider);
    final idTokenResult = await localStorage.getIdToken();
    if (idTokenResult case Success(value: final token)) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) {
  //   final DioException(:response) = err;
  //   if (response?.statusCode == 401) {
  //     final localStorage = ref.read(localStorageServiceProvider);
  //     localStorage.removeIdToken();

  //     Navigator.of(
  //       navKey.currentContext!,
  //     ).pushNamedAndRemoveUntil('/login', (_) => false);
  //   }
  // }
}

@Riverpod(keepAlive: true)
Dio backendRestClient(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: Env.backendBaseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );
  dio.options.headers['Content-Type'] = 'application/json';
  dio.interceptors.addAll([
    BackendAuthInterceptor(ref: ref),
    LogInterceptor(request: true),
    LogInterceptor(requestHeader: true),
    LogInterceptor(requestBody: true),
    LogInterceptor(responseBody: true),
    LogInterceptor(error: true),
  ]);

  return dio;
}
