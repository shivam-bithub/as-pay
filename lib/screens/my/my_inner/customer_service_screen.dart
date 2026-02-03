import 'package:flutter/material.dart';

class CustomerServiceScreen extends StatelessWidget {
  const CustomerServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6E3),
      appBar: AppBar(
        title: const Text('Customer Service'),
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
                  gradient: const LinearGradient(
                    colors: [Color(0xFFF7A800), Color(0xFFFF6B00)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.support_agent,
                      size: 48,
                      color: Colors.white,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'How can we help you?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'We\'re available 24/7 to assist you',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _buildContactOption(
                'Live Chat',
                'Start a conversation with our support team',
                Icons.chat_bubble_outline,
                const Color(0xFF3B82F6),
              ),
              const SizedBox(height: 12),
              _buildContactOption(
                'Email Support',
                'support@aspay.com',
                Icons.email_outlined,
                const Color(0xFF10B981),
              ),
              const SizedBox(height: 12),
              _buildContactOption(
                'Phone Support',
                '+91 123 456 7890',
                Icons.phone_outlined,
                const Color(0xFFF7A800),
              ),
              const SizedBox(height: 12),
              _buildContactOption(
                'WhatsApp',
                'Chat with us on WhatsApp',
                Icons.chat,
                const Color(0xFF25D366),
              ),
              const SizedBox(height: 24),
              const Text(
                'FAQs',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              _buildFAQ(
                'How do I deposit money?',
                'Go to Payment tab, click Deposit INR, enter amount and select payment method.',
              ),
              const SizedBox(height: 8),
              _buildFAQ(
                'How long does withdrawal take?',
                'Withdrawals are processed within 24 hours on business days.',
              ),
              const SizedBox(height: 8),
              _buildFAQ(
                'Is my money safe?',
                'Yes, we use bank-level encryption and security measures.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactOption(
    String title,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color),
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
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
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }

  Widget _buildFAQ(String question, String answer) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            answer,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF6B7280),
            ),
          ),
        ],
      ),
    );
  }
}
