// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:fluterproject/consts.dart';
import 'package:fluterproject/screens/rsvp.dart';
import 'screens/event_detail_screen.dart';
import 'screens/event_list_screen.dart';
import 'screens/home_screen.dart';
import 'screens/interest_selection_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MelancongApp());
}

class MelancongApp extends StatelessWidget {
  const MelancongApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Melancong',
      theme: ThemeData(
        primaryColor: colorPink,
        scaffoldBackgroundColor: colorWhite,
        fontFamily: 'Plus Jakarta Sans',
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/interests': (context) => const InterestSelectionScreen(),
        '/home': (context) => const HomeScreen(),
        '/events': (context) => const EventListPage(),
        '/event-detail': (context) => const EventDetailPage(),
        '/profile': (context) => const ProfileScreen(),
        '/rsvp': (context) => const RsvpPage(),
      },
    );
  }
}
