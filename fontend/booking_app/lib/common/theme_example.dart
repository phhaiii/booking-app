import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme.dart';

// Example theme controller using GetX for state management
class ThemeController extends GetxController {
  // Observable theme mode
  final Rx<ThemeMode> _themeMode = ThemeMode.system.obs;
  
  // Getter for current theme mode
  ThemeMode get themeMode => _themeMode.value;
  
  // Change theme mode
  void changeThemeMode(ThemeMode themeMode) {
    _themeMode.value = themeMode;
    Get.changeThemeMode(themeMode);
  }
  
  // Toggle between light and dark (system mode will use device setting)
  void toggleTheme() {
    if (_themeMode.value == ThemeMode.light) {
      changeThemeMode(ThemeMode.dark);
    } else if (_themeMode.value == ThemeMode.dark) {
      changeThemeMode(ThemeMode.system);
    } else {
      changeThemeMode(ThemeMode.light);
    }
  }
  
  // Check if current theme is dark
  bool get isDarkMode {
    if (_themeMode.value == ThemeMode.system) {
      return Get.isPlatformDarkMode;
    }
    return _themeMode.value == ThemeMode.dark;
  }
}

// Example App implementation
class BookingApp extends StatelessWidget {
  const BookingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize theme controller
    final themeController = Get.put(ThemeController());
    
    return Obx(() => GetMaterialApp(
      title: 'Booking App',
      debugShowCheckedModeBanner: false,
      
      // Apply the themes
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeController.themeMode,
      
      // Your app routes and initial screen
      initialRoute: '/',
      getPages: [
        // Add your routes here
      ],
    ));
  }
}

// Example usage in a screen
class ExampleScreen extends StatelessWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Example'),
        actions: [
          // Theme toggle button
          IconButton(
            icon: Icon(AppTheme.getThemeModeIcon(themeController.themeMode)),
            onPressed: () => themeController.toggleTheme(),
            tooltip: 'Toggle Theme',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display text styles example
            Text(
              'Display Large',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Headline Medium',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Title Large',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Body Large - This is an example of body text that shows how the Playfair Display font looks in different themes.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Body Medium with some additional text content.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            
            // Button examples
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Elevated Button'),
                ),
                const SizedBox(width: 16),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Outlined Button'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Text field example
            TextField(
              decoration: InputDecoration(
                labelText: 'Input Field',
                hintText: 'Enter some text...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Card example
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Card Title',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'This is a card with some content that demonstrates the card theme styling.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Theme mode selection
            Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Theme: ${AppTheme.getThemeModeName(themeController.themeMode)}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: AppTheme.themeModes.map((mode) => FilterChip(
                    label: Text(AppTheme.getThemeModeName(mode)),
                    selected: themeController.themeMode == mode,
                    onSelected: (selected) {
                      if (selected) {
                        themeController.changeThemeMode(mode);
                      }
                    },
                  )).toList(),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

/* 
Usage Instructions:

1. Import the theme in your main app:
   import 'common/theme.dart';

2. Apply themes to your MaterialApp:
   MaterialApp(
     theme: AppTheme.lightTheme,
     darkTheme: AppTheme.darkTheme,
     themeMode: ThemeMode.system, // or ThemeMode.light/ThemeMode.dark
   )

3. Use theme colors and text styles:
   - Colors: Theme.of(context).colorScheme.primary
   - Text Styles: Theme.of(context).textTheme.headlineMedium
   - Custom text styles: AppTextTheme.cardTitle

4. Access theme mode utilities:
   - AppTheme.getThemeModeName(ThemeMode.system) // returns "System"
   - AppTheme.getThemeModeIcon(ThemeMode.dark) // returns Icons.brightness_low

5. Theme Controller (with GetX):
   - Get.find<ThemeController>().toggleTheme()
   - Get.find<ThemeController>().changeThemeMode(ThemeMode.dark)
   - Get.find<ThemeController>().isDarkMode

6. Custom text styles from AppTextTheme:
   - AppTextTheme.cardTitle
   - AppTextTheme.priceText
   - AppTextTheme.buttonText
   - AppTextTheme.errorText
   - etc.

Note: Make sure to run `flutter packages get` after adding the font assets to pubspec.yaml
*/