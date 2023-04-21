import 'package:flutter/material.dart';

import '/widgets/post_list/post_list_widget.dart';
import '/theme/app_colors.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  static const List<String> _appBarOptions = [
    'Главная',
    'Сообщения',
    'Настройки',
  ];

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBackgroundColor,
        iconTheme: const IconThemeData(color: AppColors.iconBlue),
        elevation: 1,
        shadowColor: AppColors.mainAppBarShadowColor,
        title: Text(
          _appBarOptions[_selectedTab],
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: AppColors.appBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        backgroundColor: AppColors.bottomNavigationBackground,
        selectedItemColor: AppColors.bottomNavigationActive,
        unselectedItemColor: AppColors.bottomNavigationInactive,
        selectedFontSize: 12,
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_rounded),
            label: _appBarOptions[0],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat_bubble_rounded),
            label: _appBarOptions[1],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.build_rounded),
            label: _appBarOptions[2],
          ),
        ],
        onTap: onSelectTab,
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          const PostListWidget(),
          Center(child: Text(_appBarOptions[1])),
          Center(child: Text(_appBarOptions[2])),
        ],
      ),
    );
  }
}
