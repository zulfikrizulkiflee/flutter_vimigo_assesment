import 'package:flutter/material.dart';
import 'package:flutter_vimigo_assesment/constants.dart';
import 'package:flutter_vimigo_assesment/models/item_model.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({Key? key, required this.item, required this.onBack}) : super(key: key);

  final Item item;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    // To get padding best on screen size ratio
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double paddingValue = paddingRatio * screenWidth;
    final double verticalSpacing = screenHeight/6;

    // To get font size based on natural golden ratio
    const double titleFontSize = (defaultFontSize*2) * goldenRatio;
    const double itemDetailFontSize = defaultFontSize * goldenRatio;

    return SafeArea(
      child: Scaffold(
        appBar: screenWidth < screenWidthThreshold ? AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            child: IconButton(
              onPressed: onBack,
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.black,
                size: itemDetailFontSize*1.5
              )
            ),
          ),
        ) : null,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(paddingValue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Item ${item.key}',
                  style: const TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold
                  )
                ),
                SizedBox(height: verticalSpacing),
                Text(item.detail,
                  style: const TextStyle(fontSize: itemDetailFontSize),
                ),
                SizedBox(height: verticalSpacing),
                Text(item.subDetail,
                  style: const TextStyle(fontSize: itemDetailFontSize),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
