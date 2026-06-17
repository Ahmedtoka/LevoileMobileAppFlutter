// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flux_interface/flux_interface.dart' as _i798;
import 'package:fstore/dependency_injection/modules/firebase_module.dart'
    as _i471;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final firebaseModule = _$FirebaseModule();
  gh.factory<_i798.FirebaseNotificationService>(
    () => firebaseModule.firebaseNotificationService(),
  );
  gh.factory<_i798.LoyaltyFirestoreService>(
    () => firebaseModule.loyaltyFirestoreService(),
  );
  gh.singleton<_i798.FirebaseCoreService>(
    () => firebaseModule.firebaseCoreService(),
  );
  gh.singleton<_i798.BaseFirebaseServices>(
    () => firebaseModule.baseFirebaseServices(),
  );
  gh.singleton<_i798.FirebaseMessagingService>(
    () => firebaseModule.firebaseMessagingService(),
  );
  return getIt;
}

class _$FirebaseModule extends _i471.FirebaseModule {}
