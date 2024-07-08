import 'package:flutter/material.dart';
import 'package:greenpulse/navigation_bar.dart';
import 'package:greenpulse/pages/home.dart';
import 'package:greenpulse/pages/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      home: NavigationMenu()
      
     
    );
  }
}

