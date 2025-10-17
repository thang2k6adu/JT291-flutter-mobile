# travel_erp_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

Run the generate command => Model

```
 $ dart run build_runner build --delete-conflicting-outputs
```

### Clear Cache Project

**MAIN**

```
flutter clean
flutter pub get
flutter run
```

### Config IOS

```
cd ios
rm -rf Pods Podfile.lock
pod install --repo-update
cd ..
```

### Config Android

**Tạo SHA-1 và SHA-256 (license fingerprint)**

```
cd android
./gradlew signingReport
```

The results are returned in the form:

```yaml
Variant: debug
Config: debug
Store: $name-root/.android/debug.keystore
Alias: AndroidDebugKey
MD5: ...
SHA1: 2A:47:FF:...:A1
SHA-256: 9B:4D:...
Valid until: 2040-06-22
```

```
flutter doctor --android-licenses
```
