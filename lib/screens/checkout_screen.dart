import 'package:flutter/material.dart';
import 'success_screen.dart';

class CheckoutScreen extends StatefulWidget {
  final double totalAmount;

  const CheckoutScreen({super.key, required this.totalAmount});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int selectedDelivery = 0;
  late double orderTotal;
  double deliveryFee = 15.0;
  double taxRate = 0.08; // 8% tax

  String name = "Jane Doe";
  String address = "3 Newbridge Court, Chino Hills, CA 91709, United States";
  String cardNumber = "**** **** **** 3947";
  String paymentMethod = "Mastercard";

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    orderTotal = widget.totalAmount;
  }

  @override
  Widget build(BuildContext context) {
    double taxAmount = orderTotal * taxRate;
    double summary = orderTotal + deliveryFee + taxAmount;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Shipping address",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 10),
                _buildEditableCard(
                  title: name,
                  subtitle: address,
                  onChange: () => _editAddress(context),
                ),
                const SizedBox(height: 20),

                const Text("Payment",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 10),
                _buildPaymentCard(),
                const SizedBox(height: 20),

                const Text("Delivery method",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDeliveryOption(0, 'assets/fedex.png', '2-3 days'),
                    _buildDeliveryOption(1, 'assets/usps.png', '2-3 days'),
                    _buildDeliveryOption(2, 'assets/dhl.png', '2-3 days'),
                  ],
                ),

                const SizedBox(height: 25),

                _buildSummaryBox(summary, taxAmount),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      if (name.isEmpty || address.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill in your shipping address."),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                        return;
                      }
                      if (cardNumber.contains("*")) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please enter a valid card number."),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                        return;
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SuccessScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: const Text(
                      "SUBMIT ORDER",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEditableCard({
    required String title,
    required String subtitle,
    required VoidCallback onChange,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2))
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 5),
                Text(subtitle, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          IconButton(
            onPressed: onChange,
            icon: const Icon(Icons.edit, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/mastercard.png', width: 40),
              const SizedBox(width: 10),
              Text(cardNumber, style: const TextStyle(fontSize: 15)),
            ],
          ),
          IconButton(
            onPressed: () => _editPayment(context),
            icon: const Icon(Icons.edit, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryOption(int index, String logo, String time) {
    bool isSelected = selectedDelivery == index;
    return GestureDetector(
      onTap: () => setState(() => selectedDelivery = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 100,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey[200] : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: isSelected ? Colors.black : Colors.grey.shade300, width: 2),
        ),
        child: Column(
          children: [
            Image.asset(logo, width: 60),
            const SizedBox(height: 5),
            Text(time,
                style: TextStyle(
                    color: isSelected ? Colors.black : Colors.grey[600],
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryBox(double summary, double taxAmount) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSummaryRow("Order:", "\$${orderTotal.toStringAsFixed(2)}"),
          const SizedBox(height: 8),
          _buildSummaryRow("Delivery:", "\$${deliveryFee.toStringAsFixed(2)}"),
          const SizedBox(height: 8),
          _buildSummaryRow("Tax (8%):", "\$${taxAmount.toStringAsFixed(2)}"),
          const Divider(height: 20),
          _buildSummaryRow("Total:", "\$${summary.toStringAsFixed(2)}", isBold: true),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                fontSize: 15)),
        Text(value,
            style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                fontSize: 15)),
      ],
    );
  }

  void _editAddress(BuildContext context) {
    final nameController = TextEditingController(text: name);
    final addressController = TextEditingController(text: address);
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Edit Shipping Address"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Full Name"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Full Name is required" : null,
              ),
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(labelText: "Address"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Address is required" : null,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                setState(() {
                  name = nameController.text;
                  address = addressController.text;
                });
                Navigator.pop(context);
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void _editPayment(BuildContext context) {
    final cardController = TextEditingController();
    String selectedMethod = paymentMethod;
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Edit Payment Method"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                value: selectedMethod,
                items: const [
                  DropdownMenuItem(value: "Mastercard", child: Text("Mastercard")),
                  DropdownMenuItem(value: "Visa", child: Text("Visa")),
                  DropdownMenuItem(value: "PayPal", child: Text("PayPal")),
                ],
                onChanged: (value) => selectedMethod = value!,
                decoration: const InputDecoration(labelText: "Payment Method"),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: cardController,
                decoration: const InputDecoration(
                  labelText: "Card Number",
                  hintText: "1234 5678 9012 3456",
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  final cardRegex = RegExp(r'^\d{4} \d{4} \d{4} \d{4}$');
                  if (value == null || value.isEmpty) {
                    return 'Card number is required';
                  } else if (!cardRegex.hasMatch(value)) {
                    return 'Invalid format. Use 1234 5678 9012 3456';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                setState(() {
                  cardNumber = cardController.text;
                  paymentMethod = selectedMethod;
                });
                Navigator.pop(context);
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}
