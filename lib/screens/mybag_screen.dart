import 'package:flutter/material.dart';
import '../models/bag_item_model.dart';
import '../widgets/bag_item_card.dart';
import 'checkout_screen.dart';


class MyBagScreen extends StatefulWidget {
  const MyBagScreen({super.key});

  @override
  State<MyBagScreen> createState() => _MyBagScreenState();
}

class _MyBagScreenState extends State<MyBagScreen> {
  List<BagItem> items = [
    BagItem(
        image: 'assets/images/Pullover1.jpeg',
      title: 'Pullover',
      color: 'Green',
      size: 'S',
      price: 51,
    ),
    BagItem(
      image: 'assets/images/T-shirt1.jpeg',
      title: 'T-Shirt',
      color: 'Navy Blue',
      size: 'L',
      price: 30,
    ),
    BagItem(
      image: 'assets/images/Sportdress.jpeg',
      title: 'Sport Dress',
      color: 'Grey and white',
      size: 'M',
      price: 43,
    ),
  ];

  final TextEditingController promoController = TextEditingController();
  double discount = 0;

  void increaseQty(int index) {
    setState(() {
      items[index].quantity++;
    });
  }

  void decreaseQty(int index) {
    setState(() {
      if (items[index].quantity > 1) items[index].quantity--;
    });
  }

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Item removed from bag')),
    );
  }

  void applyPromoCode() {
    String code = promoController.text.trim().toUpperCase();

    setState(() {
      double total = items.fold(
          0, (prev, item) => prev + (item.price * item.quantity));

      if (code == 'SALE10') {
        discount = total * 0.10;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Promo code applied: 10% OFF')),
        );
      } else if (code == 'SALE20') {
        discount = total * 0.20;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Promo code applied: 20% OFF')),
        );
      } else if (code.isEmpty) {
        discount = 0;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a promo code')),
        );
      } else {
        discount = 0;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid promo code')),
        );
      }
    });
  }

  double get totalAmount {
    double total = 0;
    for (var item in items) {
      total += item.price * item.quantity;
    }
    return total - discount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        title: const Text('My Bag', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,)),
        
        centerTitle: false ,
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return BagItemCard(
                    item: items[index],
                    onAdd: () => increaseQty(index),
                    onRemove: () => decreaseQty(index),
                    onRemoveItem: () => removeItem(index),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: promoController,
              decoration: InputDecoration(
                hintText: 'Enter your promo code',
                suffixIcon: GestureDetector(
                  onTap: applyPromoCode,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.arrow_forward_ios,
                        color: Colors.white, size: 16),
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.black, // ✅ Black outline when focused
                      width: 1.5,
                    ),
                  ),
              ),
            ),
            const SizedBox(height: 15),
            Column(
              children: [
                if (discount > 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Discount:',
                          style: TextStyle(fontSize: 16, color: Colors.green)),
                      Text(
                        '-\$${discount.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total amount:',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Text(
                      '\$${totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CheckoutScreen(totalAmount: totalAmount),
      ),
    );
  },
  child: const Text(
    'CHECK OUT',
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  ),
),

            ),
          ],
        ),
      ),
    );
  }
}
