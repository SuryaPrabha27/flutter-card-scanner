import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_card_scanner_latest/flutter_card_scanner_latest.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_card_scanner_latest');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '{"result":"success",'
          '"body":"{"Cardholders Name":"test","expiry":"01/21"}","responseText":'
          '"Card has been scanned successfully"}';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('scanCard', () async {
    expect(await FlutterCardScannerLatest.scanCard, '{"result":"success",'
        '"body":"{"Cardholders Name":"test","expiry":"01/21"}","responseText":'
        '"Card has been scanned successfully"}');
  });
}
