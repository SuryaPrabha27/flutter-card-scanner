**Card Scanner Plugin**

A Flutter plugin for iOS devices for scanning credit cards using the camera. 
If a device, doesn't support camera then a manual entry screen would be shown up where the caerd details can be entered.

This plugin uses the static CardIO library and is written in iOS native language i.e. Swift

Works on latest versions of Flutter, Dart & Swift.

This plugin works only for credit cards of type AMEX, JCB, VISA, MASTER CARD & DISCOVER.

**Note: This plugin for Android is still under development, and some APIs might not be available yet.** 

**Feedback and pull requests are welcome!**

**Installation:**

1. First, add flutter_card_scanner_latest as a dependency in your pubspec.yaml file.

2. Add the following key to your Info.plist file, located in <project root>/ios/Runner/Info.plist:

      NSCameraUsageDescription - Camera in Use

**Usage:**

This is how one can invoke the plugin's method to start the scanning of credit cards.

Map<String, dynamic> details = await FlutterCardScannerLatest.scanCard();

Response:

{
"result":"success",
"body":"{"Cardholders Name":"test","expiry":"01/21"}",
"responseText":"Card has been scanned successfully"
}
