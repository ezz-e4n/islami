import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/screens/home/tabs/ahadeth_tab.dart';
import 'package:islami/screens/home/tabs/quraan_tab.dart';
import 'package:islami/screens/home/tabs/sebha_tab.dart';

import 'tabs/Settings_tab.dart';
import 'tabs/radio_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> screens = const [
    QuraanTab(),
    AhadethTab(),
    RadioTab(),
    SebhaTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            'assets/images/bg_image.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Scaffold(
            appBar: AppBar(
              title: const Text(
                "islami",
              ),
            ),
            body: screens[selectedIndex],
            bottomNavigationBar: Theme(
              data: ThemeData(
                canvasColor: Theme.of(context).primaryColor,
              ),
              child: BottomNavigationBar(
                currentIndex: selectedIndex,
                selectedItemColor: MyThemeData.accent,
                onTap: (value) {
                  selectedIndex = value;
                  setState(() {});
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/ic_quraan.png'),
                    ),
                    label: 'quraan',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/ic_ahadeth.png'),
                    ),
                    label: 'ahadeth',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/ic_radio.png'),
                    ),
                    label: 'radio',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/ic_sebha.png'),
                    ),
                    label: 'sebha',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'settings',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
