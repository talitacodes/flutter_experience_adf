// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(googleSignInService)
const googleSignInServiceProvider = GoogleSignInServiceProvider._();

final class GoogleSignInServiceProvider
    extends
        $FunctionalProvider<
          GoogleSigninService,
          GoogleSigninService,
          GoogleSigninService
        >
    with $Provider<GoogleSigninService> {
  const GoogleSignInServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'googleSignInServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$googleSignInServiceHash();

  @$internal
  @override
  $ProviderElement<GoogleSigninService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GoogleSigninService create(Ref ref) {
    return googleSignInService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoogleSigninService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoogleSigninService>(value),
    );
  }
}

String _$googleSignInServiceHash() =>
    r'96017f94fc014e44fb8cbb7f28d7f78ed7bb5abf';

@ProviderFor(localStorageService)
const localStorageServiceProvider = LocalStorageServiceProvider._();

final class LocalStorageServiceProvider
    extends
        $FunctionalProvider<
          LocalStorageService,
          LocalStorageService,
          LocalStorageService
        >
    with $Provider<LocalStorageService> {
  const LocalStorageServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localStorageServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localStorageServiceHash();

  @$internal
  @override
  $ProviderElement<LocalStorageService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalStorageService create(Ref ref) {
    return localStorageService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalStorageService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalStorageService>(value),
    );
  }
}

String _$localStorageServiceHash() =>
    r'6393dfa3b7044bce3761873180d69dc9438297b5';

@ProviderFor(tmdbService)
const tmdbServiceProvider = TmdbServiceProvider._();

final class TmdbServiceProvider
    extends $FunctionalProvider<TmdbService, TmdbService, TmdbService>
    with $Provider<TmdbService> {
  const TmdbServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tmdbServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tmdbServiceHash();

  @$internal
  @override
  $ProviderElement<TmdbService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TmdbService create(Ref ref) {
    return tmdbService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TmdbService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TmdbService>(value),
    );
  }
}

String _$tmdbServiceHash() => r'19af4ab601702e675035178b5cacc2a9a6a57098';

@ProviderFor(moviesService)
const moviesServiceProvider = MoviesServiceProvider._();

final class MoviesServiceProvider
    extends $FunctionalProvider<MoviesService, MoviesService, MoviesService>
    with $Provider<MoviesService> {
  const MoviesServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'moviesServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$moviesServiceHash();

  @$internal
  @override
  $ProviderElement<MoviesService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MoviesService create(Ref ref) {
    return moviesService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MoviesService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MoviesService>(value),
    );
  }
}

String _$moviesServiceHash() => r'e648edbbe040d62aff98904732e727d3cf49b9fb';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
