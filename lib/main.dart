import 'package:dro_store/screens/product_list_screen.dart';
import 'package:dro_store/store/mystore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<MyStore>(create: (_) => MyStore()),
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListScreen(),
    ),
  ));
}


