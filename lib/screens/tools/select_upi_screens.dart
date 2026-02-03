import 'package:flutter/material.dart';

class SelectUpiScreens extends StatelessWidget {
  const SelectUpiScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final providers = [
      {'name': 'PhonePe', 'icon': Icons.phone_android, 'color': Color(0xFF5F259F)},
      {'name': 'Google Pay', 'icon': Icons.g_mobiledata, 'color': Color(0xFF4285F4)},
      {'name': 'Paytm', 'icon': Icons.payment, 'color': Color(0xFF00BAF2)},
      {'name': 'Amazon Pay', 'icon': Icons.shopping_cart, 'color': Color(0xFFFF9900)},
      {'name': 'BHIM', 'icon': Icons.account_balance, 'color': Color(0xFF0C4DA2)},
      {'name': 'WhatsApp', 'icon': Icons.chat, 'color': Color(0xFF25D366)},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFDF6E3),
      appBar: AppBar(
        title: const Text('Select UPI Provider'),
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemCount: providers.length,
          itemBuilder: (context, index) {
            final provider = providers[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pop(provider['name']);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: (provider['color'] as Color).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        provider['icon'] as IconData,
                        size: 32,
                        color: provider['color'] as Color,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      provider['name'] as String,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
