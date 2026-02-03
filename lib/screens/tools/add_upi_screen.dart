import 'package:flutter/material.dart';
import 'select_upi_screens.dart';

class AddUpiScreen extends StatefulWidget {
  const AddUpiScreen({super.key});

  @override
  State<AddUpiScreen> createState() => _AddUpiScreenState();
}

class _AddUpiScreenState extends State<AddUpiScreen> {
  final _formKey = GlobalKey<FormState>();
  final _upiIdController = TextEditingController();
  final _nameController = TextEditingController();
  String? _selectedProvider;

  @override
  void dispose() {
    _upiIdController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6E3),
      appBar: AppBar(
        title: const Text('Add UPI'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFF7A800), Color(0xFFFF6B00)],
                ),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.account_balance,
                    size: 48,
                    color: Colors.white,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Add Your UPI Account',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Enter your UPI details to add payment method',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            // Form Section
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _upiIdController,
                        decoration: InputDecoration(
                          labelText: 'UPI ID',
                          hintText: 'example@paytm',
                          prefixIcon: const Icon(Icons.account_balance_wallet),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter UPI ID';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter valid UPI ID (e.g., name@bank)';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Account Holder Name',
                          hintText: 'Enter your full name',
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter account holder name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Select UPI Provider',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: () async {
                          final result = await Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => const SelectUpiScreens()),
                          );
                          if (result != null) {
                            setState(() {
                              _selectedProvider = result;
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFFE5E7EB)),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.apps, color: Color(0xFFF7A800)),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  _selectedProvider ?? 'Select Provider',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: _selectedProvider == null
                                        ? const Color(0xFF6B7280)
                                        : const Color(0xFF1A1A1A),
                                  ),
                                ),
                              ),
                              const Icon(Icons.arrow_forward_ios, size: 16),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (_selectedProvider == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please select UPI provider'),
                                ),
                              );
                              return;
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('UPI account added successfully!'),
                              ),
                            );
                            Navigator.of(context).pop();
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
                          'Add UPI Account',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
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
