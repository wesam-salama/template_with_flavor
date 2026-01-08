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
- **🔐 Environment Management**: Integrated `.env` support via `flutter_dotenv` for sensitive keys.
- **🎨 Dynamic App Icons**: Distinct icons for each environment to easily identify builds.
- **🏷️ App & Package Renaming**: Utilities to easily update your App Name, Bundle ID, and Package Name.
- **📱 Platform Support**: Ready for iOS and Android.

---

## 🛠️ Prerequisites

- Flutter SDK: `^3.10.4`
- Dart SDK: `^3.0.0`

---

## 🚀 Getting Started

1.  **Clone the repository**.
2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```

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

### 2. 🏷️ Change App Name

This project uses the [`rename`](https://pub.dev/packages/rename) package to easily update the App Name across platforms.

**Update for all platforms:**
```bash
dart run rename setAppName --targets ios,android --value "Your New App Name"
```

**Update for specific platform:**
```bash
# 🤖 Android only
dart run rename setAppName --targets android --value "Your New App Name"

# 🍎 iOS only
dart run rename setAppName --targets ios --value "Your New App Name"
```

### 3. 🎨 Updating App Icons

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

## � Environment Management

This project uses [`flutter_dotenv`](https://pub.dev/packages/flutter_dotenv) to manage environment variables and sensitive configuration.

### 1. 📄 `.env` File
Create a `.env` file in the root directory (it is already ignored by git).
```env
KEY_GOOGLE_MAP=your_google_maps_key_here
```

### 2. 🛠️ Usage
Access your constants through the `SystemConfig` class:
**Location**: `lib/core/utils/constants/system_config.dart`

```dart
String mapKey = SystemConfig.keyGoogleMap;
```

---

## �📍 Routing

Everything related to routing is located in `lib/core/utils/routes`. This project uses **GetX** for navigation management.

**File Structure**:
- `app_routes.dart`: Defines string constants for route names.
- `app_pages.dart`: Maps the route names to the actual Pages and Bindings.

**Usage:**

1.  **Define a Route Name**:
    Add a new constant in `app_routes.dart`:
    ```dart
    static const String profilePage = '/profilePage';
    ```

2.  **Register the Page**:
    Add a `GetPage` entry in `app_pages.dart`'s `getPages()` list:
    ```dart
    GetPage(
      name: Routes.profilePage,
      page: () => const ProfilePage(),
      binding: ProfileBinding(), // Optional: for dependency injection
    ),
    ```

3.  **Navigate**:
    Use GetX methods to navigate:
    ```dart
    // Go to a page
    Get.toNamed(Routes.profilePage);

    // Replace current page (no back button)
    Get.offNamed(Routes.profilePage);
    
    // Clear stack and go to page (good for logout)
    Get.offAllNamed(Routes.splashPage);
    ```

---

## 🌐 Network Module

The project features a simplified, highly organized network layer built on top of [Dio](https://pub.dev/packages/dio). It's designed to be powerful yet easy to use without over-engineering.

**Location**: `lib/core/network`

### 🏗️ Core Components

- **`ApiClient`**: The main engine for all network requests. It handles generic GET, POST, and custom requests.
- **`ApiConstants`**: Contains all API endpoints. The `baseUrl` is dynamically initialized in `main_common.dart` based on the active flavor.
- **`models.dart`**: Contains standardized `ApiResponse<T>` and `ApiException` for consistent data handling.
- **`interceptors/`**:
  - **`AuthInterceptor`**: Automatically injects JWT Bearer tokens and handles `401 Unauthorized` errors.
  - **`ErrorInterceptor`**: Automatically shows UI feedback (GetX Snackbars) for server errors.
  - **`LoggingInterceptor`**: Provides clean, professional console logs using `talker_dio_logger` (Debug mode only).

### ✨ Key Features

- **🚀 Automatic Loading**: Just pass `showLoader: true` to any request to show the global `SpinKitCircle` dialog.
- **🛡️ Global Error Handling**: Server errors are automatically caught and displayed to the user via Snackbars.
- **🔑 Automatic Auth**: JWT tokens are automatically attached to headers from local storage.

### 📖 Usage Example

```dart
// 1. Define your endpoint in api_constants.dart
static const String userProfile = '/user/profile';

// 2. Perform a request in your Service or Controller
final response = await _apiClient.get(
  ApiConstants.userProfile,
  showLoader: true, // Shows/hides loading dialog automatically
);

if (response.success) {
  print('Data: ${response.data}');
}
```

---

## 📐 Responsive Design

This project uses [`flutter_scale_kit`](https://pub.dev/packages/flutter_scale_kit) to ensure the UI looks consistent across different screen sizes.

**Setup**:
The `ScaleKitBuilder` is initialized in `lib/app.dart` with the standard design dimensions:
- **Width**: 375px
- **Height**: 812px

**Usage**:
Use the provided extensions to adapt your dimensions:

- `.w` : Width adaptation
- `.h` : Height adaptation
- `.sp`: Font size adaptation (scalable pixel)

```dart
Container(
  width: 100.w,    // Adapts to screen width
  height: 200.h,   // Adapts to screen height
  child: Text(
    'Responsive Text',
    style: TextStyle(fontSize: 16.sp), // Adapts font size
  ),
);
```

---

## 🖼️ Assets Management

Project assets are located in the `assets/` directory.

**Structure**:
```
assets/
├── i18n/                # Localization JSON files
├── images/              # Image assets (grouped by feature)
│   └── bottomNavigationBar/
├── launcher_icon/       # App icons for flavors
```

**Adding New Assets**:

1.  **Add the file**: Place your file in the appropriate subdirectory (e.g., `assets/images/home/`).
2.  **Declare in `pubspec.yaml`**:
    ```yaml
    flutter:
      assets:
        - assets/images/home/
    ```
3.  **Define Constant**: Add a static constant in `lib/core/themes/images.dart` (or create a new theme file if appropriate):
    ```dart
    class Images {
      static const String homeLogo = 'assets/images/home/logo.svg';
    }
    ```
4.  **Use in Code**:
    ```dart
    SvgPicture.asset(Images.homeLogo)
    // or
    Image.asset(Images.homeLogo)
    ```

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
