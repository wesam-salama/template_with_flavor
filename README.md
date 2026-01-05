# project_template

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Updating App Icons

This project uses `flutter_launcher_icons` with support for multiple flavors (`dev`, `stage`, `prod`).

### 1. Update Asset Files
Place your new icon files in the `assets/launcher_icon/` directory. Ensure the filenames match what is defined in the configuration files (or update the YAML files accordingly):
- **Dev:** `assets/launcher_icon/dev-icon.png`
- **Stage:** `assets/launcher_icon/stage-icon.png`
- **Prod:** `assets/launcher_icon/prod-icon.png`

### 2. Generate Icons
Run the following commands in your terminal to generate the platform-specific icons for each flavor:

```bash
# Generate Dev Icons
dart run flutter_launcher_icons -f flutter_launcher_icons-dev.yaml

# Generate Stage Icons
dart run flutter_launcher_icons -f flutter_launcher_icons-stage.yaml

# Generate Prod Icons
dart run flutter_launcher_icons -f flutter_launcher_icons-prod.yaml

dart run flutter_launcher_icons -f flutter_launcher_icons-dev.yaml && dart run flutter_launcher_icons -f flutter_launcher_icons-stage.yaml && dart run flutter_launcher_icons -f flutter_launcher_icons-prod.yaml
```

## ✅ Build Commands for Flutter Flavors

### 📱 Android:

```bash
flutter run -t lib/main_dev.dart --flavor dev
flutter run -t lib/main_stage.dart --flavor stage
flutter run -t lib/main_prod.dart --flavor prod
```

### 📦 Android APK build:
```bash
flutter build apk -t lib/main_dev.dart --flavor dev
flutter build apk -t lib/main_stage.dart --flavor stage
flutter build apk -t lib/main_prod.dart --flavor prod
```

### 🍏 iOS:
```bash
flutter run -t lib/main_dev.dart --flavor dev
flutter run -t lib/main_stage.dart --flavor stage
flutter run -t lib/main_prod.dart --flavor prod
```

### 📦 iOS Release build (via Xcode):

1. Open `ios/Runner.xcworkspace`
2. Select the appropriate scheme (**Dev** / **Stage** / **Prod**)
3. Build or archive from Xcode
