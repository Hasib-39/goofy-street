class ProductModel {
  final String imagePath;
  final double rating;
  final int boughtCount;
  final String category;
  final String title;
  final double currentPrice;
  final double? oldPrice; // optional

  ProductModel({
    required this.imagePath,
    required this.rating,
    required this.boughtCount,
    required this.category,
    required this.title,
    required this.currentPrice,
    this.oldPrice,
  });
}
