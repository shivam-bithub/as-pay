import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6E3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header with fireworks banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFF7A800), Color(0xFFFF6B00)],
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Text(
                                  'AP',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFF7A800),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'AID Pay',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFFF7A800),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text('Download APP'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            '🎆 Happy New Year to All AID Family! 🎆',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Wishing You Health, Happiness & Success Always ✨',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'With AIDPAY, Every Dream Can Come True ✨',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'AIDPAY – Your Trusted Payment Partner',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Scam warning banner
              Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.volume_up, color: Colors.orange),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'Beware of scams 🚫 Please do not use your...',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Click to view details'),
                    ),
                  ],
                ),
              ),
              // Recharge section
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.diamond, color: Color(0xFFF7A800)),
                        const SizedBox(width: 8),
                        const Text(
                          'Recharge: 0',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF7A800),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            '6 Day',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(5, (index) {
                        final values = [50, 50, 100, 150, 300];
                        return Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFDF6E3),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.stars,
                                color: Color(0xFFF7A800),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${values[index]}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        );
                      }),
                    ),
                    const SizedBox(height: 16),
                    const LinearProgressIndicator(
                      value: 0,
                      backgroundColor: Color(0xFFE5E7EB),
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFFF7A800)),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '0%',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6B7280),
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildQuickAmount('50k'),
                        _buildQuickAmount('100k'),
                        _buildQuickAmount('200k'),
                        _buildQuickAmount('300k'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Daily recharge section
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.bolt, color: Color(0xFFF7A800)),
                    const SizedBox(width: 8),
                    const Text(
                      'Daily recharge',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.volume_up, color: Color(0xFF10B981)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Tutorials section
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 16),
                        Text('Today Withdraw'),
                      ],
                    ),
                    const Divider(height: 32),
                    Row(
                      children: [
                        const Text('In Withdraw UPI Tools: '),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFDF6E3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text('0'),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF7A800),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text('Manage UPI Tool'),
                        ),
                      ],
                    ),
                    const Divider(height: 32),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF7A800),
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Tutorials'),
                        ),
                        const SizedBox(width: 8),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text('News'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildTutorialItem(
                      'UPI Binding Tool Instructions',
                      '💰',
                    ),
                    const SizedBox(height: 12),
                    _buildTutorialItem(
                      'UPI Order Purchase Tutorial',
                      '💰',
                    ),
                    const SizedBox(height: 12),
                    _buildTutorialItem(
                      'How to use MOK to purchase tokens',
                      '📱',
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                      ),
                      child: const Text('View more tutorials'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAmount(String amount) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF6E3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Text(
        amount,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTutorialItem(String title, String emoji) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF6E3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 32),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}
