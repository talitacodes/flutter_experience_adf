import 'package:cinebox/config/env.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tmdb_rest_client_provider.g.dart';

@Riverpod(keepAlive: true)
Dio tmdbDio(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    ),
  );
  dio.options.headers['Content-Type'] = 'application/json';
  dio.options.headers['Authorization'] = 'Bearer ${Env.theMovieDbApiKey}';
  dio.interceptors.addAll([
    LogInterceptor(request: true),
    LogInterceptor(requestHeader: true),
    LogInterceptor(requestBody: true),
    LogInterceptor(responseBody: true),
    LogInterceptor(error: true),
  ]);

  return dio;
}
