import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    / TODO: Add your Google Maps API key
        GMSServices.provideAPIKey("AIzaSyBTLUoynJ_9HGiuZQuwi9Rg0W6Dnr1C3rw")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
