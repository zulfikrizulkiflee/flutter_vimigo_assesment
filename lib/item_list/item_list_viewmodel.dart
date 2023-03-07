import 'package:flutter/cupertino.dart';
import 'package:flutter_vimigo_assesment/models/item_model.dart';
// ignore: depend_on_referenced_packages
import 'package:stacked/stacked.dart';

class ItemListViewModel extends BaseViewModel {
  List<Item> items = <Item>[];
  Item? selectedItem;
  final int _itemLength = 20;
  bool showDetail = false;

  void initialisePage() {
    for (int i = 1; i <= _itemLength; i++) {
      items.add(
        Item(
          key: i, 
          detail: 'This is detail for Item $i', 
          subDetail: 'This is some more detail for Item $i'
        )
      );
    }
    
    notifyListeners();
  }
  
  void showItemDetail(int key) {
    selectedItem = items.firstWhere((element) => element.key == key);
    showDetail = true;

    notifyListeners();
  }

  void onBack() {
    showDetail = false;
    selectedItem = null;

    notifyListeners();
  }
}
