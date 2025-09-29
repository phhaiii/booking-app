import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common/theme.dart';
import 'features/screen/login.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wedding App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Follows device setting
      
      // Set the login screen as the initial route
      home: const LoginScreen(),
      
      // Define your app routes here
      getPages: [
        GetPage(
          name: '/login',
          page: () => const LoginScreen(),
        ),
        // Add more routes as you create more screens
        // GetPage(
        //   name: '/home',
        //   page: () => const HomeScreen(),
        // ),
        // GetPage(
        //   name: '/signup',
        //   page: () => const SignUpScreen(),
        // ),
      ],
      
      // Initial route
      initialRoute: '/login',
    );
  }
}