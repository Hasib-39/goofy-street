import '../models/product_model.dart';

class HomeProducts {
  static final List<ProductModel> newArrivals = [
    ProductModel(
      imagePath: "assets/products/evening_dress.png",
      rating: 4.5,
      boughtCount: 10,
      category: "Dorothy Perkins",
      title: "Evening Dress",
      currentPrice: 12,
      oldPrice: 15,
    ),
    ProductModel(
      imagePath: "assets/products/casual_shirt.webp",
      rating: 4.4,
      boughtCount: 20,
      category: "Zara",
      title: "Casual Shirt",
      currentPrice: 22,
    ),
  ];

  static final List<ProductModel> saleItems = [
    ProductModel(
      imagePath: "assets/products/sports_dress.png",
      rating: 4.2,
      boughtCount: 8,
      category: "Sitlly",
      title: "Sports Dress",
      currentPrice: 19,
      oldPrice: 22,
    ),
    ProductModel(
      imagePath: "assets/products/casual_shirt.webp",
      rating: 4.4,
      boughtCount: 20,
      category: "Zara Kids",
      title: "Kids T-Shirt",
      currentPrice: 15,
      oldPrice: 20,
    ),
  ];
}

class WomenProducts {
  static final List<ProductModel> newArrivals = [
    ProductModel(
      imagePath: "assets/products/evening_dress.png",
      rating: 4.5,
      boughtCount: 10,
      category: "Dorothy Perkins",
      title: "Evening Dress",
      currentPrice: 12,
      oldPrice: 15,
    ),
    ProductModel(
      imagePath: "assets/products/sports_dress.png",
      rating: 4.2,
      boughtCount: 8,
      category: "Sitlly",
      title: "Sports Dress",
      currentPrice: 19,
      oldPrice: 22,
    ),
  ];

  static final List<ProductModel> clothes = [
    ProductModel(
      imagePath: "assets/products/evening_dress.png",
      rating: 4.5,
      boughtCount: 10,
      category: "Dorothy Perkins",
      title: "Evening Dress",
      currentPrice: 12,
      oldPrice: 15,
    ),
    ProductModel(
      imagePath: "assets/products/sports_dress.png",
      rating: 4.2,
      boughtCount: 8,
      category: "Sitlly",
      title: "Sports Dress",
      currentPrice: 19,
      oldPrice: 22,
    ),
  ];

  static final List<ProductModel> shoes = [
    ProductModel(
      imagePath: "assets/products/evening_dress.png",
      rating: 4.7,
      boughtCount: 42,
      category: "Nike",
      title: "Women's Air Max 90",
      currentPrice: 130,
      oldPrice: 150,
    ),
  ];

  static final List<ProductModel> accessories = [
    ProductModel(
      imagePath: "assets/products/sports_dress.png",
      rating: 4.9,
      boughtCount: 50,
      category: "Fossil",
      title: "Women's Watch",
      currentPrice: 160,
      oldPrice: 200,
    ),
  ];
}

class MenProducts {
  static final List<ProductModel> newArrivals = [
    ProductModel(
      imagePath: "assets/products/casual_shirt.webp",
      rating: 4.4,
      boughtCount: 20,
      category: "Zara",
      title: "Casual Shirt",
      currentPrice: 22,
    ),
  ];

  static final List<ProductModel> clothes = [
    ProductModel(
      imagePath: "assets/products/casual_shirt.webp",
      rating: 4.4,
      boughtCount: 20,
      category: "Zara",
      title: "Casual Shirt",
      currentPrice: 22,
    ),
  ];

  static final List<ProductModel> shoes = [
    ProductModel(
      imagePath: "assets/products/casual_shirt.webp",
      rating: 4.7,
      boughtCount: 42,
      category: "Nike",
      title: "Men's Air Max 90",
      currentPrice: 130,
      oldPrice: 150,
    ),
  ];

  static final List<ProductModel> accessories = [
    ProductModel(
      imagePath: "assets/products/casual_shirt.webp",
      rating: 4.9,
      boughtCount: 50,
      category: "Fossil",
      title: "Men's Watch",
      currentPrice: 160,
      oldPrice: 200,
    ),
  ];
}

class KidsProducts {
  static final List<ProductModel> newArrivals = [
    ProductModel(
      imagePath: "assets/products/casual_shirt.webp",
      rating: 4.4,
      boughtCount: 20,
      category: "Zara Kids",
      title: "Kids T-Shirt",
      currentPrice: 15,
    ),
  ];

  static final List<ProductModel> clothes = [
    ProductModel(
      imagePath: "assets/products/casual_shirt.webp",
      rating: 4.4,
      boughtCount: 20,
      category: "Zara Kids",
      title: "Kids T-Shirt",
      currentPrice: 15,
    ),
  ];

  static final List<ProductModel> shoes = [
    ProductModel(
      imagePath: "assets/products/casual_shirt.webp",
      rating: 4.7,
      boughtCount: 42,
      category: "Nike Kids",
      title: "Kids Sneakers",
      currentPrice: 80,
      oldPrice: 95,
    ),
  ];

  static final List<ProductModel> accessories = [
    ProductModel(
      imagePath: "assets/products/casual_shirt.webp",
      rating: 4.9,
      boughtCount: 50,
      category: "Kids Accessories",
      title: "Backpack",
      currentPrice: 25,
      oldPrice: 30,
    ),
  ];
}
