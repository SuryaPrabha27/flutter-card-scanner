#import "FlutterCardScannerLatestPlugin.h"
#import "CardIOPaymentViewControllerDelegate.h"
#if __has_include(<flutter_card_scanner_latest/flutter_card_scanner_latest-Swift.h>)
#import <flutter_card_scanner_latest/flutter_card_scanner_latest-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_card_scanner_latest-Swift.h"
#endif

@implementation FlutterCardScannerLatestPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    [SwiftFlutterCardScannerLatestPlugin registerWithRegistrar:registrar];
}
@end
