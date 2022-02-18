// ignore_for_file: avoid_print

import 'package:dro_store/model/products.dart';
import 'package:dro_store/store/store_data.dart';
import 'package:dro_store/widgets/search_widget.dart';
import 'package:flutter/material.dart';




class Search extends ChangeNotifier {

    bool val = false;


  void isVisible (bool visible) {
    val = visible ;
    notifyListeners();
  }



}

