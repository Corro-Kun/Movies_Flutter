import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get apiToken => dotenv.env['API_TOKEN'] ?? '';
}
