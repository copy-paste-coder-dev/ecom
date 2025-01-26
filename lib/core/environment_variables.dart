import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvType { development, production }

class EnvironmentVariables {
  EnvironmentVariables._();
  static final EnvironmentVariables instance = EnvironmentVariables._();
  static const String envTypeKey = "ENV_TYPE";
  
  String? _envType;
  String get envType => _envType ?? '';
  bool get debugMode => _envType == 'dev';
  
  Future<void> init({required EnvType envType}) async {
    switch (envType) {
      case EnvType.development:
        await dotenv.load(fileName: '.env.dev');
        
      case EnvType.production:
        await dotenv.load(fileName: '.env.prod');
        
    }
    _envType = dotenv.get(envTypeKey);
  }
}
