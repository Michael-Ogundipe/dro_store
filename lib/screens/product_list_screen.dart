import 'package:dro_store/screens/product_detail_screen.dart';
import 'package:dro_store/store/mystore.dart';
import 'package:flutter/material.dart';
import 'package:dro_store/responsive_parent_widget.dart';
import 'package:provider/provider.dart';
import 'package:dro_store/constants.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    return Scaffold(
      body: ResponsiveSafeArea(
        responsiveBuilder: (context, size) {
          return GridView.builder(
            itemCount: store.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  // sets the selected item as the active product
                  store.setActiveProduct(store.products[i]);
                  // moves to the product detail screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailScreen()));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150.0,
                      height: 125.0,
                      child: FadeInImage.assetNetwork(
                          fit: BoxFit.contain,
                          placeholder: '',
                          image: store.products[i].productImage.toString()),
                    ),

                    // displays the product name Boldly
                    Text(
                      store.products[i].productName.toString(),
                      style: Constants.kBoldProductName,
                    ),
                    Text(store.products[i].productContent.toString()),
                    Text(store.products[i].productType.toString()),
                    const SizedBox(
                      height: 5.0,
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
