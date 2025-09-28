import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:striv/utils/app_palette.dart';
import 'package:striv/pages/navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppPalette.background,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(StrivApp());
}

class StrivApp extends StatelessWidget {
  const StrivApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        scaffoldBackgroundColor: AppPalette.primaryBackground,
      ),
      home: Navigation(),
    );
  }
}
