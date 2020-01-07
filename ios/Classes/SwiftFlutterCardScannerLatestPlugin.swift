import Flutter
import UIKit

public class SwiftFlutterCardScannerLatestPlugin: NSObject ,FlutterPlugin,CardIOPaymentViewControllerDelegate  {
    
    var flutterResult : FlutterResult!
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_card_scanner_latest", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterCardScannerLatestPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let window: UIWindow = ((UIApplication.shared.delegate?.window)!)!
        let controller = window.rootViewController as! FlutterViewController
        //Doing this will load the scanning functionality much more faster.
        CardIOUtilities.preload();
        self.flutterResult = result;
        self.scanCard(controller: controller, result : result)
    }
    
    public func scanCard(controller : FlutterViewController, result : @escaping FlutterResult) {
        //Initialising the controller which is the starting point of scan i.e.CardIOPaymentViewController
        let cardIOVC = CardIOPaymentViewController(paymentDelegate : self)
        //Setting few more paramters here for security purpose.
        cardIOVC?.collectCardholderName = true
        cardIOVC?.disableManualEntryButtons = true
        cardIOVC?.hideCardIOLogo = true
        cardIOVC?.maskManualEntryDigits = true
        cardIOVC?.collectCVV = false
        //Presents the view here.
        controller.present(cardIOVC!, animated: true, completion: nil)
    }
    
    public func userDidCancel(_ paymentViewController: CardIOPaymentViewController!) {
        //This method would be invoked automatically depending on the inputs from the view(if the user cancels the scan manually), once we get the control here contructing the respective response and sending back to flutter.
        let outputResult = NSString(format: "{\"result\":\"failure\",\"body\":{\"Cardholders Name\" : \"null\",\"expiry\": \"null\"},\"responseText\":\"User has cancelled the scan\"}")
        flutterResult(outputResult)
        paymentViewController?.dismiss(animated : true, completion: nil)
    }
    public func userDidProvide(_ cardInfo: CardIOCreditCardInfo!, in paymentViewController: CardIOPaymentViewController!) {
         //This method would be invoked automatically depending on the inputs from the view(if the user clicks on save), once we get the control here contructing the respective response and sending back to flutter.
        if let cardDetails = cardInfo {
            let outputResult = NSString(format: "{\"result\":\"success\",\"body\":{\"Cardholders Name\" : \"%@\",\"expiry\": \"%02lu/%lu\"},\"responseText\":\"Card has been scanned successfully\"}", cardDetails.cardholderName, cardDetails.expiryMonth, cardDetails.expiryYear)
            flutterResult(outputResult)
        }
        paymentViewController?.dismiss(animated : true, completion: nil)
    }
}
