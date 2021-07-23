// library bottom_nav;

import 'package:flutter/material.dart';

BottomNavigationBar bottom_nav(BuildContext context, int currentIndex) {
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.account_balance_wallet),
        label: '首页',
      ),
      BottomNavigationBarItem(icon: Icon(Icons.mail), label: '查询')
    ],
    currentIndex: currentIndex,
    onTap: (value) => {
      if (value == 0) {Navigator.pushNamed(context, '/home')},
      if (value == 1) {Navigator.pushNamed(context, '/mine')}
    },
  );
}
