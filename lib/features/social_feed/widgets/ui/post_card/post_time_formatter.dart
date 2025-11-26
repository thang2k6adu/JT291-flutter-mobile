import 'package:timeago/timeago.dart' as timeago;

/// Utility class for formatting post time
class PostTimeFormatter {
  static String format(DateTime dateTime) {
    return timeago.format(dateTime, locale: 'en_short');
  }
}

