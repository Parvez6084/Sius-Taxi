# SisuTaxi 🚖

A Flutter-based taxi booking and navigation application with **Google Maps integration**, **real-time location tracking**, and **route drawing**.

---

## 🚀 Features
- Real-time location tracking using GPS
- Display maps with **Google Maps Flutter**
- Convert coordinates into addresses using **Geocoding**
- Draw routes with **Polyline Points**
- Structured state management with **GetX**



# Output

<p float="left">
  <img src="assets/screenshots/1.png" width="180">
  <img src="assets/screenshots/2.png" width="180">
  <img src="assets/screenshots/3.png" width="180">
  <img src="assets/screenshots/4.png" width="180">
</p>
---

## 🛠️ Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/Parvez6084/Sius-Taxi.git
cd sisutaxi
```

### 2. Install Dependencies
Run the following command to install all required dependencies:
```bash
flutter pub get
```

### 3. Configure Google Maps API Key
To use Google Maps, you need an **API Key** from Google Cloud Platform.

1. Go to [Google Cloud Console](https://console.cloud.google.com/).
2. Create a new project (or use an existing one).
3. Enable the following APIs:
    - Maps SDK for Android
    - Maps SDK for iOS
    - Geocoding API
    - Directions API
4. Generate an API Key.

#### Add API Key to Android
Edit `android/app/src/main/AndroidManifest.xml`:
```xml
<manifest>
    <application>
        <!-- Add inside application tag -->
        <meta-data
            android:name="com.google.android.geo.API_KEY"
            android:value="YOUR_API_KEY_HERE"/>
    </application>
</manifest>
```

#### Add API Key to iOS
Edit `ios/Runner/AppDelegate.swift` (or `AppDelegate.m` for Objective-C):
```swift
import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("YOUR_API_KEY_HERE")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```

---

## 📦 Dependencies Used

| Package                  | Usage                                                                 |
|---------------------------|----------------------------------------------------------------------|
| **flutter**               | Flutter SDK core                                                     |
| **cupertino_icons**       | iOS-style icons                                                      |
| **get**                   | State management & navigation                                        |
| **http**                  | REST API integration                                                 |
| **location**              | Fetch device’s current location                                      |
| **geocoding**             | Convert coordinates ↔ addresses                                      |
| **google_maps_flutter**   | Display Google Maps in Flutter apps                                  |
| **flutter_polyline_points** | Draw polylines (routes) on Google Maps                              |

---

## 📂 Assets
- `assets/images/` → App images
- `assets/mapthemes/` → Custom map themes (e.g., dark mode, night mode)

---

## ▶️ Run the App
```bash
flutter run
```

Make sure you run it on a device/emulator with **Google Play Services** (for Android) or a real iPhone device (since iOS simulator does not support Google Maps).

---

## 📌 Notes
- Ensure GPS is enabled on the device.
- Test API key on both Android and iOS.
- You may need to add billing information to Google Cloud for Maps APIs.

