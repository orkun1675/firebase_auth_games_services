import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'package:firebase_auth_games_services/src/firebase_auth_games_services_method_channel.dart';

abstract class FirebaseAuthGamesServicesPlatform extends PlatformInterface {
  /// Constructs a FirebaseAuthGamesServicesPlatform.
  FirebaseAuthGamesServicesPlatform() : super(token: _token);

  static final Object _token = Object();

  static FirebaseAuthGamesServicesPlatform _instance =
      MethodChannelFirebaseAuthGamesServices();

  /// The default instance of [FirebaseAuthGamesServicesPlatform] to use.
  ///
  /// Defaults to [MethodChannelFirebaseAuthGamesServices].
  static FirebaseAuthGamesServicesPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FirebaseAuthGamesServicesPlatform] when
  /// they register themselves.
  static set instance(FirebaseAuthGamesServicesPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> isSignedIn() {
    throw UnimplementedError('isSignedIn() has not been implemented.');
  }

  Future<String?> getAuthCode() {
    throw UnimplementedError('getAuthCode() has not been implemented.');
  }

  Future<String?> signIn() {
    throw UnimplementedError('signIn() has not been implemented.');
  }
}
