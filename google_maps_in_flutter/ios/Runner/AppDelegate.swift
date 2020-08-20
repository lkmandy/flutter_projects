import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyBtc5Zf0DD9e7kb-eN3uv6_CmW8-lczv0M")
    GMSPlacesClient.provideAPIKey("AIzaSyBtc5Zf0DD9e7kb-eN3uv6_CmW8-lczv0M")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
