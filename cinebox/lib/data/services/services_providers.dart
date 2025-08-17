import 'package:cinebox/data/core/rest_client/backend_rest_client_provider.dart';
import 'package:cinebox/data/core/rest_client/tmdb_rest_client_provider.dart';
import 'package:cinebox/data/services/auth/auth_service.dart';
import 'package:cinebox/data/services/google_signin/google_signin_service.dart';
import 'package:cinebox/data/services/google_signin/google_signin_service_impl.dart';
import 'package:cinebox/data/services/local_storage/local_storage_service.dart';
import 'package:cinebox/data/services/local_storage/local_storage_service_impl.dart';
import 'package:cinebox/data/services/movies/movies_service.dart';
import 'package:cinebox/data/services/tmdb/tmdb_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'services_providers.g.dart';

@riverpod
GoogleSigninService googleSignInService(Ref ref) {
  return GoogleSigninServiceImpl();
}

@Riverpod(keepAlive: true)
LocalStorageService localStorageService(Ref ref) {
  return LocalStorageServiceImpl(flutterSecureStorage: FlutterSecureStorage());
}

AuthService authService(Ref ref) {
  return AuthService(ref.read(backendRestClientProvider));
}

@riverpod
TmdbService tmdbService(Ref ref) {
  return TmdbService(ref.read(tmdbDioProvider));
}

@riverpod
MoviesService moviesService(Ref ref) {
  return MoviesService(ref.read(backendRestClientProvider));
}
