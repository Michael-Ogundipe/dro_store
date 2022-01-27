import 'package:dro_store/model/products.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class MyStore extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _bag = [];
  Product? _activeProduct;

  // a constructor to initialize the variables
  MyStore() {
    _products.add(Product(
        id: 1,
        productName: "Kezitill Susp.",
        productContent: "Cerfuroxime Axetill",
        productType: "Oral Suspenstion - 125mg",
        productImage: "https://bit.ly/3IBbmnG",
        productPrice: 820,
        productQuantity: 1));
    _products.add(Product(
        id: 2,
        productName: "Kezitill ",
        productContent: "Cerfuroxime Axetill",
        productType: "Oral Suspenstion - 125mg",
        productImage: "https://bit.ly/3IBbmnG",
        productPrice: 820,
        productQuantity: 1));
    _products.add(Product(
        id: 3,
        productName: "Garlic oil",
        productContent: "Garlic Oil",
        productType: "Oral Suspenstion - 125mg",
        productImage: "https://bit.ly/3IBbmnG",
        productPrice: 820,
        productQuantity: 1));
    _products.add(Product(
        id: 4,
        productName: "Folic Acid.",
        productContent: "Folix Acid",
        productType: "Oral Suspenstion - 125mg",
        productImage: "https://bit.ly/3IBbmnG",
        productPrice: 820,
        productQuantity: 1));

    // sends notification to the provider
    notifyListeners();
  }

  // getter functions to get the variables into the UI
  List<Product> get products => _products;

  List<Product> get bag => _bag;

  Product? get activeProduct => _activeProduct;

  setActiveProduct(Product p) {
    _activeProduct = p;
  }

  // section to add or remove object from the bag

  // to add an object to the bag
  addItemToBag(Product p) {
    // it finds if the item p is already in the bag
    Product? found = _bag.firstWhereOrNull((a) => a.id == p.id);
    if (found != null) {
      found.productQuantity = found.productQuantity!.toInt() + 1;
    } else {
      _bag.add(p);
    }
    notifyListeners();
  }

  // to remove an object to the bag
  removeItemFromBag(Product p) {
    // it finds if the item p is already in the bag
    Product? found = _bag.firstWhereOrNull((a) => a.id == p.id);
    if (found != null) {
      found.productQuantity = found.productQuantity!.toInt() - 1;
    } else {
      _bag.remove(p);
    }
    notifyListeners();
  }

  // Counts the number of items added into the bag
  getBagQuantity() {
    int total = 0;
    for (int i = 0; i < bag.length; i++) {
      total += bag[i].productQuantity!.toInt();
    }
    return total;
  }
}
