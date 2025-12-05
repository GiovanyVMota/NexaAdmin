import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const NexaAdminApp());
}

class NexaAdminApp extends StatelessWidget {
  const NexaAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NexaAdmin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D0D0D),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: "Roboto",
      ),
      home: const HomePage(),
    );
  }
}
