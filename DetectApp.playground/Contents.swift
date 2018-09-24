//: Playground - noun: a place where people can play

import UIKit

/*
 Info.plist - Add the app name that you are wanting to detect on the device
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>AppName</string>
</array>
*/

guard let url = URL(string: "AppName://appTest") else {
    fatalError("AppName cannot be detected on this device.")
}

if UIApplication.shared.canOpenURL(url) {
    // Deeplink or open the URL to AppName on your device.
} else {
    // Notify the user that AppName is not available and they need to install it.
}
