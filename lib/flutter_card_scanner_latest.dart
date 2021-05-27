import 'dart:async';

import 'package:flutter/services.dart';
//Plugin for iOS devices for scanning credit cards using the camera.
// If a device, doesn't support camera then a manual entry screen
// would be shown up where the card details can be entered.
class FlutterCardScannerLatest {
  static const MethodChannel _channel =
      const MethodChannel('flutter_card_scanner_latest');

  static Future<String> get scanCard async {
    final String scannedCardDetails = await _channel.invokeMethod('scanCard');
    return scannedCardDetails;
  }
}
