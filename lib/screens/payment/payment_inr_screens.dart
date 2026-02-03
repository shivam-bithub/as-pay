import 'package:flutter/material.dart';

class PaymentInrScreens extends StatefulWidget {
  const PaymentInrScreens({super.key});

  @override
  State<PaymentInrScreens> createState() => _PaymentInrScreensState();
}

class _PaymentInrScreensState extends State<PaymentInrScreens> {
  final _amountController = TextEditingController();
  String? _selectedMethod;

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6E3),
      appBar: AppBar(
        title: const Text('Deposit INR'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Enter Amount',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixText: '₹ ',
                        hintText: '0.00',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFFDF6E3),
                      ),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildAmountChip('500'),
                        _buildAmountChip('1,000'),
                        _buildAmountChip('2,000'),
                        _buildAmountChip('5,000'),
                        _buildAmountChip('10,000'),
                        _buildAmountChip('20,000'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Payment Method',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildPaymentMethod(
                      'UPI',
                      'PhonePe, GooglePay, Paytm',
                      Icons.phone_android,
                      'upi',
                    ),
                    const Divider(),
                    _buildPaymentMethod(
                      'Bank Transfer',
                      'IMPS/NEFT/RTGS',
                      Icons.account_balance,
                      'bank',
                    ),
                    const Divider(),
                    _buildPaymentMethod(
                      'QR Code',
                      'Scan to pay',
                      Icons.qr_code_scanner,
                      'qr',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_amountController.text.isNotEmpty &&
                      _selectedMethod != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Processing payment...'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter amount and select method'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF7A800),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Proceed to Pay',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmountChip(String amount) {
    return InkWell(
      onTap: () {
        setState(() {
          _amountController.text = amount.replaceAll(',', '');
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFFDF6E3),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Text(
          '₹$amount',
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildPaymentMethod(
      String title, String subtitle, IconData icon, String value) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedMethod = value;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFFDF6E3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: const Color(0xFFF7A800)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ),
            Radio<String>(
              value: value,
              groupValue: _selectedMethod,
              onChanged: (val) {
                setState(() {
                  _selectedMethod = val;
                });
              },
              activeColor: const Color(0xFFF7A800),
            ),
          ],
        ),
      ),
    );
  }
}
