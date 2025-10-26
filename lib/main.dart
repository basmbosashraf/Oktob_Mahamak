/*import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await Hive.openBox('tasksBox');

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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFFB6C1)),
      ),
      home: const SplashScreen(),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Hive.initFlutter(); // 🔹 تهيئة Hive
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
