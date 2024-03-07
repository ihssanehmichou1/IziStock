import 'package:logger/logger.dart';

class TLoggerHelper {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),

    level: Level.debug,
  );
}