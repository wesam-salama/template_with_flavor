import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:get/get.dart';
import 'core/bindings/main_binding.dart';
import 'core/utils/localization/app_localizations.dart';
import 'core/utils/localization/locale_controller.dart';
import 'core/utils/localization/app_locales.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/utils/routes/app_pages.dart';
import 'core/utils/services/storage.dart';
import 'features/splash/presentation/views/splash_page.dart';
import 'core/utils/localization/translation_extensions.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Using GetBuilder to listen to changes in LocaleController.
    // We initialize the controller here to ensure it's available.
    return GetBuilder<LocaleController>(
      init: LocaleController(Storage()),
      builder: (controller) {
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

            // Used to bind the locale from the controller
            locale: controller.locale,

            // Used to define supported locales
            supportedLocales: AppLocales.locales,

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
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            // Used to set the initial page
            home: const SplashPage(),

            // Used to set the pages
            getPages: AppPages().getPages(),

            // Used to listen to navigation events
            navigatorObservers: <NavigatorObserver>[
              GetObserver((_) {}, Get.routing),
            ],

            // Used to set the app title
            title: 'Flutter Demo',

            // Used to set the app theme
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display translated text
            Text(
              'hello_world'.translate()!,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            // Button to toggle language
            ElevatedButton(
              onPressed: () {
                Get.find<LocaleController>().toggleLocale();
              },
              child: Text('toggle_language'.translate()!),
            ),
            const SizedBox(height: 20),
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
