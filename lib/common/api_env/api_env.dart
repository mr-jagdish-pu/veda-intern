import 'package:envied/envied.dart';

part 'api_env.g.dart';

@envied
abstract class Env {
  @EnviedField(varName: 'NEWS_API', obfuscate: true)
  static final String key = _Env.key;
}
/*
flutter pub add envied
flutter pub add --dev envied_generator
flutter pub add --dev build_runner
 */
