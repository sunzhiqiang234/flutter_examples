import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../gift/gift_page.dart';
import '../my_page/my_page.dart';
import 'bottom_bar_type.dart';

// 在存储空间里面，注册这个对象，以及初始值
final indexProvider =  StateProvider((ref) => 0);

class MainTabPage extends ConsumerWidget  {
  const MainTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref ) {
    // 要得到真正的值，要watch这个对象
    final indexState = ref.watch(indexProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _activePage(indexState),
      bottomNavigationBar: BottomNavigationBar(
        // 使用值
        currentIndex: indexState,
        onTap: (index) {
          // set新值
          ref.read(indexProvider.notifier).state = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            activeIcon: Icon(Icons.home),
            label: "ホーム",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            activeIcon: Icon(Icons.card_giftcard),
            label: "プレゼント",
          ),
        ],
        // unselectedItemColor: ColorName.gray,
        // selectedItemColor: ColorName.deepPink,
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        selectedLabelStyle: const TextStyle(fontSize: 12),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        iconSize: 35,
      ),
    );
  }

  Widget _activePage(int indexState ) {
    switch (indexState) {
      case 0:
        return const GiftPage();
      case 1:
        return const MyPage();
      default:
        return const GiftPage();
    }

  }

}
