import 'package:flutter/material.dart';
import 'change_password_screen.dart'; 

class SettingsScreen extends StatefulWidget 
{
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Text controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController(text: '12/12/1989');

  // Notification toggles
  bool salesNotification = true;
  bool newArrivalsNotification = false;
  bool deliveryStatusNotification = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),

            // Personal info header
            Text(
              'Personal Information',
              style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Full name
            _buildTextField('Full name', _nameController),

            // Date of Birth
            _buildTextField('Date of birth', _dobController),

            const SizedBox(height: 24),

            // Password section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Password',
                  style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),

                // Updated to open modal instead of route
                TextButton(
                  onPressed: () {
                    ChangePasswordScreen.show(context);
                  },
                  child: const Text('Change'),
                ),
              ],
            ),
            _buildTextField('Password', TextEditingController(text: '********'), obscure: true),

            const SizedBox(height: 24),

            // Notifications
            Text(
              'Notifications',
              style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Updated Switches (modern Flutter 3.22+)
            SwitchListTile(
              title: const Text('Sales'),
              value: salesNotification,
              onChanged: (val) => setState(() => salesNotification = val),
              thumbColor: WidgetStateProperty.resolveWith((states) =>
                  states.contains(WidgetState.selected) ? Colors.black : Colors.grey),
              trackColor: WidgetStateProperty.resolveWith((states) =>
                  states.contains(WidgetState.selected) ? Colors.black26 : Colors.grey.shade300),
            ),
            SwitchListTile(
              title: const Text('New arrivals'),
              value: newArrivalsNotification,
              onChanged: (val) => setState(() => newArrivalsNotification = val),
              thumbColor: WidgetStateProperty.resolveWith((states) =>
                  states.contains(WidgetState.selected) ? Colors.black : Colors.grey),
              trackColor: WidgetStateProperty.resolveWith((states) =>
                  states.contains(WidgetState.selected) ? Colors.black26 : Colors.grey.shade300),
            ),
            SwitchListTile(
              title: const Text('Delivery status changes'),
              value: deliveryStatusNotification,
              onChanged: (val) => setState(() => deliveryStatusNotification = val),
              thumbColor: WidgetStateProperty.resolveWith((states) =>
                  states.contains(WidgetState.selected) ? Colors.black : Colors.grey),
              trackColor: WidgetStateProperty.resolveWith((states) =>
                  states.contains(WidgetState.selected) ? Colors.black26 : Colors.grey.shade300),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    bool obscure = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        readOnly: label == 'Password',
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
