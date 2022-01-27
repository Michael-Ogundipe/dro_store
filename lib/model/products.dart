//data class to support object creation

class Product {
  int? id;
  int? productQuantity;
  String? productName;
  String? productType;
  String? productContent;
  String? productImage;
  double? productPrice;


  // constructor
  Product(
      {this.id,
      this.productName,
      this.productContent,
      this.productType,
      this.productImage,
      this.productPrice,
      this.productQuantity});
}
