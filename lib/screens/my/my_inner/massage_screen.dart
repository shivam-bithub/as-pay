import 'package:flutter/material.dart';

class MassageScreen extends StatelessWidget {
  const MassageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = [
      {
        'title': 'Welcome to AsPay',
        'message': 'Thank you for registering! Complete your profile to unlock all features.',
        'time': '2 hours ago',
        'read': false,
      },
      {
        'title': 'Deposit Successful',
        'message': 'Your deposit of ₹5000 has been credited to your account.',
        'time': '1 day ago',
        'read': true,
      },
      {
        'title': 'Refer & Earn',
        'message': 'Share your referral code and earn ₹100 for each friend!',
        'time': '2 days ago',
        'read': true,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFDF6E3),
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final msg = messages[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: msg['read'] as bool
                    ? Colors.white
                    : const Color(0xFFFFF9E6),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: msg['read'] as bool
                      ? const Color(0xFFE5E7EB)
                      : const Color(0xFFF7A800),
                  width: msg['read'] as bool ? 1 : 2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          msg['title'] as String,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (!(msg['read'] as bool))
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF7A800),
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    msg['message'] as String,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    msg['time'] as String,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF9CA3AF),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
