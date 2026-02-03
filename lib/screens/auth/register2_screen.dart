import 'package:flutter/material.dart';
import '../root_shell.dart';

class Register2Screen extends StatefulWidget {
  const Register2Screen({super.key});

  @override
  State<Register2Screen> createState() => _Register2ScreenState();
}

class _Register2ScreenState extends State<Register2Screen> {
  final _formKey = GlobalKey<FormState>();
  final _referralCodeController = TextEditingController();
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _referralCodeController.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      if (!_agreeToTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please agree to terms and conditions')),
        );
        return;
      }
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const RootShell()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6E3),
      appBar: AppBar(
        title: const Text('Register - Step 2'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Almost Done!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Complete your registration',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _referralCodeController,
                  decoration: InputDecoration(
                    labelText: 'Referral Code (Optional)',
                    prefixIcon: const Icon(Icons.card_giftcard_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    helperText: 'Enter referral code if you have one',
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE5E7EB)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        '• I agree to the Terms of Service\n'
                        '• I agree to the Privacy Policy\n'
                        '• I am 18 years or older\n'
                        '• I agree to receive promotional emails',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B7280),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        value: _agreeToTerms,
                        onChanged: (value) {
                          setState(() {
                            _agreeToTerms = value ?? false;
                          });
                        },
                        title: const Text('I agree to all terms and conditions'),
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF7A800),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Complete Registration',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
