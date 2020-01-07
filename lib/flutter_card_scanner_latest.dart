import 'dart:async';

import 'package:flutter/services.dart';

class FlutterCardScannerLatest {
  static const MethodChannel _channel =
      const MethodChannel('flutter_card_scanner_latest');

  static Future<String> get scanCard async {
    final String scannedCardDetails = await _channel.invokeMethod('scanCard');
    return scannedCardDetails;
  }
}
