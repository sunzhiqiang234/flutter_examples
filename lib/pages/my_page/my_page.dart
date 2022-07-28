import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../gift/gift_page.dart';
import '../main_tab/main_tab_page.dart';


class MyPage extends ConsumerWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexState = ref.watch(indexProvider);
    final inputState = ref.watch(inputProvider);

    return Center(
        child: Column(
      children: [
        Text("マイページ$indexState"),
        Text("マイページ$inputState"),
      ],
    ));
  }
}
