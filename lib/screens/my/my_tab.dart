import 'package:flutter/material.dart';
import 'my_inner/customer_service_screen.dart';
import 'my_inner/massage_screen.dart';
import 'my_inner/payment_history_screen.dart';
import 'my_inner/quota_history_screen.dart';
import 'my_inner/transfer_assets_screen.dart';
import 'my_inner/usdt_deposit_screen.dart';
import 'my_inner/user_info_screen.dart';

class MyTab extends StatelessWidget {
  const MyTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFFF7A800),
                  const Color(0xFFFF6B00),
                ],
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Color(0xFFF7A800),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Guest User',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'ID: AS123456',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Column(
              children: [
                _buildMenuItem(
                  context,
                  'Customer Service',
                  () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const CustomerServiceScreen())),
                ),
                _buildMenuItem(
                  context,
                  'Messages',
                  () => Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const MassageScreen())),
                ),
                _buildMenuItem(
                  context,
                  'Payment History',
                  () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const PaymentHistoryScreen())),
                ),
                _buildMenuItem(
                  context,
                  'Quota History',
                  () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const QuotaHistoryScreen())),
                ),
                _buildMenuItem(
                  context,
                  'Transfer Assets',
                  () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const TransferAssetsScreen())),
                ),
                _buildMenuItem(
                  context,
                  'USDT Deposit',
                  () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const UsdtDepositScreen())),
                ),
                _buildMenuItem(
                  context,
                  'User Info',
                  () => Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const UserInfoScreen())),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF1A1A1A),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Color(0xFFF7A800), size: 16),
          ],
        ),
      ),
    );
  }
}
