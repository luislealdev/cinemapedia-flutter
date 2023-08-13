import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String moviesKey =
      dotenv.env['THE_MOVIEDB_APIKEY'] ?? "There's not an api key";
}
