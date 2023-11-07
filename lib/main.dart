import 'package:demo_connect/providers/courses_provider.dart';
import 'package:demo_connect/providers/experience_provider.dart';
import 'package:demo_connect/providers/prep_material_provider.dart';
import 'package:demo_connect/providers/resume_provider.dart';
import 'package:demo_connect/providers/tips_provider.dart';
import 'package:demo_connect/screens/signup_screen.dart';
import 'package:demo_connect/screens/test_home_screen.dart';
// import 'package:demo_connect/screens/login_screenrial_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ResumeProvider>(
          create: (context) => ResumeProvider(),
        ),
        ChangeNotifierProvider<ExperienceProvider>(
          create: (context) => ExperienceProvider(),
        ),
        ChangeNotifierProvider<PrepMaterialProvider>(
          create: (context) => PrepMaterialProvider(),
        ),
        ChangeNotifierProvider<CoursesProvider>(
          create: (context) => CoursesProvider(),
        ),
        ChangeNotifierProvider<TipsProvider>(
          create: (context) => TipsProvider(),
        ),
      ],
      child: MaterialApp(
        home: TestHomeScreen(),
      ),
    );
  }
}
