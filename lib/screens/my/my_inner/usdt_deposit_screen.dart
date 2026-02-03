import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UsdtDepositScreen extends StatefulWidget {
  const UsdtDepositScreen({super.key});

  @override
  State<UsdtDepositScreen> createState() => _UsdtDepositScreenState();
}

class _UsdtDepositScreenState extends State<UsdtDepositScreen> {
  final _amountController = TextEditingController();
  String _selectedNetwork = 'TRC20';

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
        title: const Text('USDT Deposit'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.currency_bitcoin,
                      size: 48,
                      color: Colors.white,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'USDT Deposit',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Deposit cryptocurrency to your wallet',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Select Network',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildNetworkButton('TRC20'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildNetworkButton('ERC20'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Deposit Address',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
                child: Column(
                  children: [
                    const Text(
                      'TExampleAddressFor12345678901234',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'monospace',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: () {
                        Clipboard.setData(
                          const ClipboardData(
                              text: 'TExampleAddressFor12345678901234'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Address copied!'),
                          ),
                        );
                      },
                      icon: const Icon(Icons.copy, size: 18),
                      label: const Text('Copy Address'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF7A800),
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF9E6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.warning_amber, color: Color(0xFFF7A800)),
                        SizedBox(width: 8),
                        Text(
                          'Important',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• Only send USDT to this address\n• Ensure you select the correct network\n• Minimum deposit: 10 USDT\n• Deposits are credited after 12 confirmations',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNetworkButton(String network) {
    final isSelected = _selectedNetwork == network;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedNetwork = network;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF7A800) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:
                isSelected ? const Color(0xFFF7A800) : const Color(0xFFE5E7EB),
          ),
        ),
        child: Text(
          network,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF6B7280),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
