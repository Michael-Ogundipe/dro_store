import 'package:dro_store/screens/product_list_screen.dart';
import 'package:dro_store/store/store_data.dart';
import 'package:dro_store/widgets/visibility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<MyStore>(create: (_) => MyStore()),
      ChangeNotifierProvider<Search>(create: (_) => Search())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListScreen(),
    ),
  ));
}


