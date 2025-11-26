/*
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Hive.initFlutter(); 
    await Hive.openBox('tasksBox'); // 🔹 فتح الصندوق
  } catch (e) {
    debugPrint('❌ Hive init error: $e');
  }

  runApp(const AktobMahamek2026());
}

class AktobMahamek2026 extends StatelessWidget {
  const AktobMahamek2026({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'اكتب مهامك 2026',
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: const Color(0xFFF8F8FF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFB6C1),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
*/





import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/task_model.dart';
import 'screens/splash_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ لازم تهيئي Hive
  await Hive.initFlutter();

  // ✅ ضروري جدًا تسجيل الـ Adapter قبل أي openBox
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(TaskAdapter());
  }

  // ✅ فتح الصندوق بعد التسجيل
  await Hive.openBox<Task>('tasksBox');
FlutterError.onError = (FlutterErrorDetails details) {
  FlutterError.dumpErrorToConsole(details);
};

  runApp(const AktobMahamek2026());
}

class AktobMahamek2026 extends StatelessWidget {
  const AktobMahamek2026({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'اكتب مهامك 2026',
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: const Color(0xFFF8F8FF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFB6C1),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
