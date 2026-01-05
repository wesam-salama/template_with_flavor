# 📱 Flutter Project Template

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=Dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white" alt="Android">
  <img src="https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white" alt="iOS">
</p>

This is a robust **Flutter Project Template** pre-configured with support for multiple build flavors, dynamic icons, and easy package naming. It serves as a solid foundation for scalable mobile applications.

---

## 🚀 Features

- **🏗️ Multiple Flavors**: Pre-configured environments for `Dev`, `Stage`, and `Prod`.
- **🎨 Dynamic App Icons**: Distinct icons for each environment to easily identify builds.
- **🏷️ Start Package Renaming**: Utilities to easily update your app's bundle ID and package name.
- **📱 Platform Support**: Ready for iOS and Android.

---

## 🛠️ Configuration

### 1. 📦 Change App Package Name

This project is equipped with the [`change_app_package_name`](https://pub.dev/packages/change_app_package_name) package to streamline updating your Bundle ID and Package Name.

**Update for all platforms:**
```bash
dart run change_app_package_name:main com.new.package.name
```

**Update for specific platform:**
```bash
# 🤖 Android only
dart run change_app_package_name:main com.new.package.name --android

# 🍎 iOS only
dart run change_app_package_name:main com.new.package.name --ios
```

### 2. 🎨 Updating App Icons

This project leverages the [`flutter_launcher_icons`](https://pub.dev/packages/flutter_launcher_icons) package to generate and manage app icons for each flavor (Dev, Stage, Prod).

#### Step 1: Place Asset Files
Add your icon files to `assets/launcher_icon/`. Ensure naming corresponds to your config:
- **Dev**: `assets/launcher_icon/dev-icon.png`
- **Stage**: `assets/launcher_icon/stage-icon.png`
- **Prod**: `assets/launcher_icon/prod-icon.png`

#### Step 2: Generate Icons
Run the following to generate platform-specific icons for all flavors:

```bash
# 🚀 Run all at once
dart run flutter_launcher_icons -f flutter_launcher_icons-dev.yaml && \
dart run flutter_launcher_icons -f flutter_launcher_icons-stage.yaml && \
dart run flutter_launcher_icons -f flutter_launcher_icons-prod.yaml
```

<details>
<summary>Click to see individual commands</summary>

```bash
# Dev
dart run flutter_launcher_icons -f flutter_launcher_icons-dev.yaml

# Stage
dart run flutter_launcher_icons -f flutter_launcher_icons-stage.yaml

# Prod
dart run flutter_launcher_icons -f flutter_launcher_icons-prod.yaml
```
</details>

---

## ⏯️ Running & Building

### 🏃‍♂️ Run App

Use the following commands to run the app in different environments (Debug mode by default).

| Environment | Command |
|-------------|---------|
| **Dev**     | `flutter run -t lib/main_dev.dart --flavor dev` |
| **Stage**   | `flutter run -t lib/main_stage.dart --flavor stage` |
| **Prod**    | `flutter run -t lib/main_prod.dart --flavor prod` |

### 📦 Build APK (Android)

Create release builds for Android.

| Environment | Command |
|-------------|---------|
| **Dev**     | `flutter build apk -t lib/main_dev.dart --flavor dev` |
| **Stage**   | `flutter build apk -t lib/main_stage.dart --flavor stage` |
| **Prod**    | `flutter build apk -t lib/main_prod.dart --flavor prod` |

### � Build for iOS

1. Open the workspace:
   ```bash
   open ios/Runner.xcworkspace
   ```
2. Select the appropriate scheme in Xcode:
   - **Dev**
   - **Stage**
   - **Prod**
3. Go to **Product > Archive** to build a release.

---

## 📚 Getting Started with Flutter

If this is your first Flutter project, here are some resources:
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For more information, visit the [online documentation](https://docs.flutter.dev/).
