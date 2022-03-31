// library bottom_nav;

import 'package:flutter/material.dart';

BottomNavigationBar bottom_nav(BuildContext context, int currentIndex) {
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: '首页',
      ),
      BottomNavigationBarItem(icon: Icon(Icons.abc), label: '查询'),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet), label: '我的')
    ],
    currentIndex: currentIndex,
    onTap: (value) {
      if (value == 0) {
        Navigator.popAndPushNamed(context, '/home');
      }

      if (value == 1) {
        Navigator.popAndPushNamed(context, '/search');
      }

      if (value == 2) {
        Navigator.popAndPushNamed(context, '/mine');
      }
    },
  );
}
