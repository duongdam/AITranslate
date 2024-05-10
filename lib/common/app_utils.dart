import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';

bool get isAndroid => !kIsWeb && Platform.isAndroid;

bool get isIos => !kIsWeb && Platform.isIOS;

bool get isWeb => kIsWeb;

class AppUtils {
  static String formatDate(String value) {
    /// Parse string Timestamp(seconds=1710103755, nanoseconds=718000000) to DateTime
    final seconds = int.parse(value.split(',')[0].split('=')[1]);
    final date = DateTime.fromMillisecondsSinceEpoch(seconds * 1000).toLocal();
    return DateFormat("dd/MM/yy HH:mm").format(date);
  }
}

enum LoadStatus {
  loading,
  success,
  error,
  empty,
  loadMore,
  fail,
  loadMoreFail,
  notFoundIds,
  streamAI,
  reFetch
}
