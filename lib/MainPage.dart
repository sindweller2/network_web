import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network_web/FacebookPage.dart';
import 'package:network_web/InstagramPage.dart';
import 'package:network_web/TelegramPage.dart';
import 'package:network_web/TiktokPage.dart';
import 'package:network_web/TwitterPage.dart';
import 'package:network_web/WhatsappPage.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const NetworkWeb());
}

class NetworkWeb extends StatelessWidget {
  const NetworkWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network Web',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const MainPage(title: 'Network Web'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});
  final String title;

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  late final WebViewController controller;

  static final List<Widget> _widgetOptions = <Widget>[
    const WhatsappPage(),
    const TelegramPage(),
    const InstagramPage(),
    const TwitterPage(),
    const TiktokPage(),
    const FacebookPage(),
    const Text(
      'Copyright 2022 by Danny',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.whatsapp),
            label: 'Whatsapp',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.telegram),
            label: 'Telegram',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.instagram),
            label: 'Instagram',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.twitter),
            label: 'Twitter',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.tiktok),
            label: 'Tiktok',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.facebook),
            label: 'Facebook',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
