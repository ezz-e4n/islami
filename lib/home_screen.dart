import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

import 'home/tabs/ahadeth/ahadeth_tab.dart';
import 'home/tabs/quraan/quraan_tab.dart';
import 'home/tabs/radio/radio_tab.dart';
import 'home/tabs/sebha/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [QuraanTab(), AhadethTab(), RadioTab(), SebhaTab()];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/main_bg.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: const Text('اسلامي')),
        body: tabs[selectedIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Theme.of(context).primaryColor),
          child: BottomNavigationBar(
            selectedItemColor: AppTheme.black,
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                label: 'quran',
                icon: ImageIcon(AssetImage('assets/images/ic_quran.png')),
              ),
              BottomNavigationBarItem(
                label: 'ahadeth',
                icon: ImageIcon(AssetImage('assets/images/ic_ahadeth.png')),
              ),
              BottomNavigationBarItem(
                label: 'radio',
                icon: ImageIcon(AssetImage('assets/images/ic_radio.png')),
              ),
              BottomNavigationBarItem(
                label: 'sebha',
                icon: ImageIcon(AssetImage('assets/images/ic_sebha.png')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
