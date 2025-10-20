import 'package:flutter/material.dart';

class ShippingAddressesScreen extends StatelessWidget {
  const ShippingAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Shipping Addresses'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _addressCard(
            context,
            name: 'Jane Doe',
            address: '3 Newbridge Court\nChino Hills, CA 91709, United States',
            isSelected: true,
          ),
          _addressCard(
            context,
            name: 'John Doe',
            address: '3 Newbridge Court\nChino Hills, CA 91709, United States',
            isSelected: false,
          ),
          _addressCard(
            context,
            name: 'John Doe',
            address: '51 Riverside\nChino Hills, CA 91709, United States',
            isSelected: false,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addAddress');
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _addressCard(
    BuildContext context, {
    required String name,
    required String address,
    required bool isSelected,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Edit',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              address,
              style: TextStyle(
                color: Colors.grey[700],
                height: 1.3,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Checkbox(
                  value: isSelected,
                  onChanged: (val) {},
                  activeColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const Text('Use as the shipping address'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




