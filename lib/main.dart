import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management_ui/screens/home_screen.dart';
import 'package:task_management_ui/utils/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.bgColor,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Management Ui',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.bgColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.bgColor,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 15, color: AppColors.grey),
        ),
        textTheme: GoogleFonts.robotoTextTheme(
          const TextTheme(
            bodyMedium: TextStyle(color: Colors.white),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
