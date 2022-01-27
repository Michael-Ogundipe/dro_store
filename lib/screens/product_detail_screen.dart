import 'package:dro_store/constants.dart';
import 'package:dro_store/store/mystore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dro_store/responsive_parent_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[Text(store.getBagQuantity().toString())],
      ),
      body: ResponsiveSafeArea(
        responsiveBuilder: (context, size) {
          return Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: FadeInImage.assetNetwork(
                      width: 150.0,
                      height: 150.0,
                      placeholder: '',
                      image: store.activeProduct!.productImage.toString()),
                ),
                Padding(
                    child: Text(
                      store.activeProduct!.productName.toString(),
                      style: Constants.kBoldProductName,
                    ),
                    padding: const EdgeInsets.all(8.0)),
                Padding(
                    child: Text(store.activeProduct!.productType.toString(),
                      style: Constants.kBoldProductName,
                    ),
                    padding: const EdgeInsets.all(8.0)),
                Padding(
                    child: Text(store.activeProduct!.productPrice.toString()),
                    padding: const EdgeInsets.all(8.0)),
                const SizedBox(
                  height: 100.0,
                ),
                Container(
                  width: 150.0,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          // remove an item out of the bag
                          store.removeItemFromBag(store.activeProduct!);
                        },
                      ),
                      Text(store.activeProduct!.productQuantity.toString()),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          // adds an item into the bag
                          store.addItemToBag(store.activeProduct!);
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
