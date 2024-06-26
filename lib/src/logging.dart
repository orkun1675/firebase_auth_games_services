import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

import 'package:logging/logging.dart';

/// The logger for this package.
final Logger logger = Logger('FirebaseAuthGamesServices');

/// Whether or not the logging is enabled.
bool _enabled = false;

/// Logs the message if logging is enabled.
void log(String message, {Level level = Level.INFO}) {
  if (_enabled) {
    logger.log(level, message);
  }
}

StreamSubscription<LogRecord>? _subscription;

/// Forwards diagnostic messages to the dart:developer log() API.
void setLogging({bool enabled = false}) {
  _subscription?.cancel();
  _enabled = enabled;
  if (!enabled || hierarchicalLoggingEnabled) {
    return;
  }

  _subscription = logger.onRecord.listen((LogRecord e) {
    // use `dumpErrorToConsole` for severe messages to ensure that severe
    // exceptions are formatted consistently with other Flutter examples and
    // avoids printing duplicate exceptions
    if (e.level >= Level.SEVERE) {
      final Object? error = e.error;
      FlutterError.dumpErrorToConsole(
        FlutterErrorDetails(
          exception: error is Exception ? error : Exception(error),
          stack: e.stackTrace,
          library: e.loggerName,
          context: ErrorDescription(e.message),
        ),
      );
    } else {
      _developerLog(e);
    }
  });
}

void _developerLog(LogRecord record) {
  developer.log(
    record.message,
    time: record.time,
    sequenceNumber: record.sequenceNumber,
    level: record.level.value,
    name: record.loggerName,
    zone: record.zone,
    error: record.error,
    stackTrace: record.stackTrace,
  );
}
