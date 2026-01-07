import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:get/get.dart';
import 'core/bindings/main_binding.dart';
import 'core/themes/app_themes/app_theme.dart';
import 'core/themes/controllers/theme_controller.dart';
// import 'core/utils/localization/app_localizations.dart';
// import 'core/utils/localization/locale_controller.dart';
// import 'core/utils/localization/app_locales.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/utils/routes/app_pages.dart';
// import 'core/utils/routes/app_routes_observers.dart';
// import 'core/utils/storage/storage.dart';
import 'core/utils/localization/app_translations.dart';
import 'core/utils/localization/controllers/localization_controller.dart';
import 'features/splash/presentation/views/splash_page.dart';
// import 'core/utils/localization/translation_extensions.dart';
import 'core/utils/constants/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Using GetBuilder to listen to changes in LocaleController.
    // We initialize the controller here to ensure it's available.
    return ScaleKitBuilder(
      designWidth: 375,
      designHeight: 812,
      designType: DeviceType.mobile,
      child: GetMaterialApp(
        // Used to bind the initial binding
        initialBinding: MainBinding(),

        // Used to hide the debug banner
        debugShowCheckedModeBanner: false,

        // Used to manage the smart management
        smartManagement: SmartManagement.keepFactory,

        // Localization configuration
        // Used to define translations
        translations: AppTranslations(), // App translations
        // Used to bind the locale from the controller
        locale: LocalizationController.to.currentLocale,
        // Used to define supported locales
        supportedLocales: LocalizationController.to.supportedLocales,
        // Used to resolve the locale
        localeResolutionCallback:
            (Locale? locale, Iterable<Locale> supportedLocales) {
              if (locale != null) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale.languageCode) {
                    return supportedLocale;
                  }
                }
              }
              return supportedLocales.first;
            },
        // Used to register localization delegates
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],

        // Navigation configuration
        // Used to set the initial page
        home: const SplashPage(),
        // Used to set the pages
        getPages: AppPages().getPages(),
        // Used to listen to navigation events
        // navigatorObservers: [AppRouteObserver()],
        // Used to listen to navigation events
        routingCallback: (routing) {
          if (routing?.current == '/home') {
            Get.snackbar("Hi", "You are on the home route");
          }
        },

        // Used to set the app title
        title: 'Flutter Demo',

        // Theme configuration
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        themeMode: ThemeController.to.themeMode,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final localizationController = Get.find<LocalizationController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Obx(() {
            // Access the observable to ensure Obx rebuilds when theme changes
            // ignore: unused_local_variable
            final mode = themeController.themeMode;
            return IconButton(
              icon: Icon(themeController.themeModeIcon),
              onPressed: themeController.toggleTheme,
              tooltip: 'Toggle Theme',
            );
          }),
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: localizationController.toggleLocale,
            tooltip: 'Toggle Language',
          ),

          GetBuilder<LocalizationController>(
            builder: (controller) {
              // Ensure we match the current locale by language code to avoid DropdownButton value errors
              final currentLocale = controller.currentLocale;
              final theme = Theme.of(context);
              final isDark = theme.brightness == Brightness.dark;

              return DropdownButton<Locale>(
                value: currentLocale,
                icon: Icon(
                  Icons.language,
                  color:
                      theme.appBarTheme.iconTheme?.color ??
                      (isDark ? AppColors.white : AppColors.black),
                ),
                underline:
                    const SizedBox(), // Remove underline for cleaner look
                dropdownColor: isDark ? AppColors.dark : AppColors.white,
                style: TextStyle(
                  color: isDark ? AppColors.white : AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                onChanged: (Locale? newLocale) {
                  if (newLocale != null) {
                    controller.setLocale(newLocale);
                  }
                },
                items: controller.supportedLocales
                    .map<DropdownMenuItem<Locale>>((locale) {
                      return DropdownMenuItem<Locale>(
                        value: locale,
                        child: Text(
                          controller.localeSpecificLanguageName(locale),
                          style: TextStyle(
                            color: isDark
                                ? AppColors.white
                                : AppColors.textPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    })
                    .toList(),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSectionHeader(context, 'Typography'),
            Text(
              'Display Large',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              'Display Medium',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              'Headline Medium',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text('Title Large', style: Theme.of(context).textTheme.titleLarge),
            Text('Body Large', style: Theme.of(context).textTheme.bodyLarge),
            Text('Body Medium', style: Theme.of(context).textTheme.bodyMedium),
            Text('Label Large', style: Theme.of(context).textTheme.labelLarge),

            _buildSectionHeader(context, 'Buttons'),
            Wrap(
              spacing: 12.w,
              runSpacing: 12.h,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
                OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
                TextButton(onPressed: () {}, child: const Text('Text Info')),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.check),
                  label: const Text('Icon'),
                ),
                const ElevatedButton(onPressed: null, child: Text('Disabled')),
              ],
            ),

            _buildSectionHeader(context, 'Inputs'),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Standard Input',
                hintText: 'Type something...',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 12.h),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Error State',
                errorText: 'This field has an error',
                prefixIcon: Icon(Icons.error),
              ),
            ),

            _buildSectionHeader(context, 'Components'),
            Wrap(
              spacing: 12.w,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Checkbox(value: true, onChanged: (v) {}),
                Checkbox(value: false, onChanged: (v) {}),
                Switch(value: true, onChanged: (v) {}),
                const Chip(label: Text('Chip')),
                const CircleAvatar(child: Text('A')),
              ],
            ),

            _buildSectionHeader(context, 'Localization'),
            Text(
              'systemLanguage'.tr,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'welcomeTitle'.tr,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.h),
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        Divider(height: 16.h),
        SizedBox(height: 8.h),
      ],
    );
  }
}
