import 'package:logging/logging.dart';

class AppLogger {
  AppLogger(String name) : _logger = Logger(name);

  final Logger _logger;

  void info(String message) => _logger.info(message);

  void warning(String message) => _logger.warning(message);

  void error(String message, [Object? error, StackTrace? stackTrace]) => _logger.severe(message, error, stackTrace);
}
