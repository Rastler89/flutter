import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String movieDB = dotenv.env['THE_MOVIEDB_KEY'] ?? 'NO API KEY';
}