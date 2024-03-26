import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    } else {
      // Return FirebaseOptions for other platforms (e.g., Android, iOS)
      return android; // Default to Android options for non-web platforms
    }
  }

  static FirebaseOptions get web {
    // Firebase options for web
    return const FirebaseOptions(
      // Replace with your actual Firebase configuration for web
      apiKey: "YOUR_WEB_API_KEY",
      authDomain: "YOUR_AUTH_DOMAIN",
      projectId: "YOUR_PROJECT_ID",
      storageBucket: "YOUR_STORAGE_BUCKET",
      messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
      appId: "YOUR_APP_ID",
      measurementId: "YOUR_MEASUREMENT_ID",
    );
  }

  static FirebaseOptions get android {
    // Firebase options for Android
    return const FirebaseOptions(
      // Replace with your actual Firebase configuration for Android
      apiKey: "YOUR_ANDROID_API_KEY",
      authDomain: "YOUR_AUTH_DOMAIN",
      projectId: "YOUR_PROJECT_ID",
      storageBucket: "YOUR_STORAGE_BUCKET",
      messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
      appId: "YOUR_APP_ID",
      measurementId: "YOUR_MEASUREMENT_ID",
    );
  }

// You can add similar methods for other platforms (e.g., iOS)
// static FirebaseOptions get ios { ... }
}


