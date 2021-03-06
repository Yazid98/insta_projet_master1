import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:insta_projet_master1/pages/all_survey.dart';
import 'package:insta_projet_master1/chat/chat.dart';
import 'package:insta_projet_master1/pages/dashboard.dart';
import 'package:insta_projet_master1/pages/profile.dart';
import 'package:insta_projet_master1/pages/survey.dart';

import 'chat/chat_home_screen.dart';

class HomeScreen extends StatefulWidget {
  late final String currentUserId;

  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final screen = [Survey(), Dashboard(),Profile(), ChatHomeScreen(currentUserId: '',), AllSurvey()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index : selectedIndex,
          items: [
            Icon(Icons.help, size: 30),
            Icon(Icons.dashboard, size: 30),
            Icon(Icons.person, size: 30),
            Icon(Icons.message, size: 30),
            Icon(Icons.playlist_add_check_sharp, size: 30),
          ],
        onTap: (index){
          setState(() {
             selectedIndex = index;
          });
        },
        animationDuration: const Duration(milliseconds: 300),
      ),
      body: screen[selectedIndex],
    );
  }
}

