import 'package:flutter/material.dart';
import 'package:flutter_vimigo_assesment/constants.dart';
import 'package:flutter_vimigo_assesment/widgets/item_detail.dart';
// ignore: depend_on_referenced_packages
import 'package:stacked/stacked.dart';

import 'package:flutter_vimigo_assesment/item_list/item_list_viewmodel.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ItemListViewModel>.reactive(
        viewModelBuilder: () => ItemListViewModel(),
        onViewModelReady: (model) {
          model.initialisePage();
        },
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              body: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                  return Row(
                    children: <Widget>[
                      if (constraints.maxWidth > screenWidthThreshold || !model.showDetail)
                        Expanded(
                          flex: constraints.maxWidth > screenWidthThreshold ? 2 : 1,
                          child: _generateItemList(context, model)
                        ),
                      if (model.showDetail)
                        Expanded(
                          flex: constraints.maxWidth > screenWidthThreshold ? 4 : 1,
                          child: ItemDetail(
                            item: model.selectedItem!,
                            onBack: () {
                              model.onBack();
                            }
                          ),
                        ),
                    ],
                  );
              }),
            ),
          );
        });
  }

  Widget _generateItemList(BuildContext context, ItemListViewModel model) {
    const double listItemFontSize = defaultFontSize * goldenRatio;

    return ListView.separated(
      itemCount: model.items.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => model.showItemDetail(model.items[index].key),
        child: ListTile(
          title: Text(
            'Item ${model.items[index].key}',
            style: const TextStyle(fontSize: listItemFontSize),
          ),
          trailing: const Icon(Icons.chevron_right, size: listItemFontSize*1.5),
        ),
      ),
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
}
