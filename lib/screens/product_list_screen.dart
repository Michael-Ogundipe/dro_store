// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'package:dro_store/model/products.dart';
import 'package:dro_store/store/store_data.dart';
import 'package:dro_store/widgets/visibility.dart';
import 'package:dro_store/widgets/rounded_icon.dart';
import 'package:dro_store/screens/product_detail_screen.dart';
import 'package:dro_store/store/store_data.dart';
import 'package:dro_store/widgets/search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dro_store/responsive_parent_widget.dart';
import 'package:provider/provider.dart';
import 'package:dro_store/constants.dart';

class ProductListScreen extends StatefulWidget {
  ProductListScreen({Key? key}) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {


  late List<Product> products;
  String query = '';


  @override
  void initState() {
    super.initState();
    products = allProduct;
  }

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    var search = Provider.of<Search>(context);

    return Scaffold(
      body: ResponsiveSafeArea(
        responsiveBuilder: (context, size) {
          return Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RoundedIcon(
                        iconName: Icons.filter_alt_outlined,
                        onPressed: () {},
                      ),
                      RoundedIcon(
                        iconName: Icons.search,
                        onPressed: () {
                          search.isVisible(true);
                        },
                      )
                    ],
                  ),
                ),
                Visibility(
                    visible: search.val,
                    child: buildSearch()),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: GridView.builder(
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, i) {
                        final product = products[i];

                        return InkWell(
                          onTap: () {
                            // sets the selected item as the active product
                            store.setActiveProduct(product);
                            // moves to the product detail screen
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailScreen()));
                          },
                          child: Card(
                            elevation: 5.0,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      width: 150.0,
                                      height: 125.0,
                                      child: Image.asset(
                                        product.productImage.toString(),
                                        fit: BoxFit.contain,),
                                    ),
                                  ),

                                  // displays the product name Boldly
                                  Text(
                                    product.productName.toString(),
                                    style: Constants.kBoldProductName,
                                  ),
                                  // displays the product content
                                  Text(product.productContent.toString()),
                                  // displays the product type
                                  Text(product.productType.toString()),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  // displays the product price
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton(
                                      child: Text(
                                          product.productPrice.toString()),
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .all(Color(0xff909090)),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(18.0),
                                              )
                                          )
                                      ),
                                      onPressed: () {},
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildSearch() =>
      SearchWidget(
        text: query,
        hintText: 'Product Name',
        onChanged: searchBook,
      );


  void searchBook(String query) {
    final products = allProduct.where((product) {
      final titleLower = product.productName!.toLowerCase();
      final authorLower = product.productContent!.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.products = products;
    });
  }

}
