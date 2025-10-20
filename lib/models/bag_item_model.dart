class BagItem {
  String image;
  String title;
  String color;
  String size;
  int price;
  int quantity;

  BagItem({
    required this.image,
    required this.title,
    required this.color,
    required this.size,
    required this.price,
    this.quantity = 1,
  });
}
