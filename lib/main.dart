import 'package:flutter/material.dart';
import 'package:flutter_vimigo_assesment/item_list/item_list_view.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ItemListView(),
    );
  }
}
