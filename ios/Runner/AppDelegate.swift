import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GMSServices.provideAPIKey("APIKEY")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

struct KeyManager {
   private let keyFilePath = Bundle.main.path(forResource: "APIKey", ofType: "plist")
   func getKeys() -> NSDictionary? {
     guard let keyFilePath = keyFilePath else {
       return nil
     }
     return NSDictionary(contentsOfFile: keyFilePath)
   }
   
   func getValue(key: String) -> AnyObject? {
       guard let keys = getKeys() else {
         return nil
       }
     return keys[key]! as AnyObject
   }
}