import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../widgets/tool_detail_header.dart';

class PaymentHistoryScreen extends StatelessWidget {
  final VoidCallback? onBackTap;

  const PaymentHistoryScreen({
    super.key,
    this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    final payments = [
      _PaymentRecord(
        type: 'Credit Card',
        bank: 'HDFC Bank',
        date: 'Paid on 05 May 2025',
        amount: '₹ 12,500',
        status: 'On Time',
        icon: Icons.credit_card_rounded,
        iconBgColor: AppColors.toolPurpleBg,
        iconColor: AppColors.toolPurpleIcon,
      ),
      _PaymentRecord(
        type: 'Personal Loan',
        bank: 'IDFC First Bank',
        date: 'Paid on 01 May 2025',
        amount: '₹ 15,742',
        status: 'On Time',
        icon: Icons.account_balance_wallet_outlined,
        iconBgColor: const Color(0xFFFCE8E6),
        iconColor: const Color(0xFFE53935),
      ),
      _PaymentRecord(
        type: 'Credit Card',
        bank: 'SBI Card',
        date: 'Paid on 20 Apr 2025',
        amount: '₹ 8,900',
        status: 'On Time',
        icon: Icons.credit_card_rounded,
        iconBgColor: AppColors.toolBlueBg,
        iconColor: AppColors.toolBlueIcon,
      ),
      _PaymentRecord(
        type: 'Home Loan',
        bank: 'HDFC Bank',
        date: 'Paid on 01 Apr 2025',
        amount: '₹ 32,650',
        status: 'On Time',
        icon: Icons.home_outlined,
        iconBgColor: AppColors.toolOrangeBg,
        iconColor: AppColors.toolOrangeIcon,
      ),
    ];

    return Scaffold(
      appBar: ToolDetailHeader(
        title: 'Payment History',
        subtitle: 'Analysis of your payments.',
        actionIcon: Icons.calendar_today_rounded,
        onBackTap: onBackTap,
        onActionTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Filter by date...')),
          );
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Behaviour Banner Card
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.toolGreenBg,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFC6F6D5), width: 1),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Payment Behaviour',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textMuted,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Good',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: AppColors.toolGreenIcon,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'You have a good payment track record. Keep it up!',
                          style: TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textMedium,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Green Shield Icon
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: AppColors.toolGreenIcon,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.shield_rounded,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Recent Payments',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),

            const SizedBox(height: 14),

            // Payments List
            Column(
              children: payments.map((payment) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFEDF2F7), width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF64748B).withValues(alpha: 0.04),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: payment.iconBgColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(payment.icon, color: payment.iconColor, size: 22),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                payment.type,
                                style: const TextStyle(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textDark,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '${payment.bank} • ${payment.date}',
                                style: const TextStyle(
                                  fontSize: 10.5,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textMuted,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              payment.amount,
                              style: const TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              payment.status,
                              style: const TextStyle(
                                fontSize: 10.5,
                                fontWeight: FontWeight.bold,
                                color: AppColors.toolGreenIcon,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 8),

            // Bottom Tip Card
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.toolGreenBg,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFC6F6D5), width: 1),
              ),
              child: Row(
                children: const [
                  Icon(Icons.star_rounded, color: AppColors.toolGreenIcon, size: 18),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Great! You have made all payments on time.',
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.bold,
                        color: AppColors.toolGreenIcon,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentRecord {
  final String type;
  final String bank;
  final String date;
  final String amount;
  final String status;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;

  _PaymentRecord({
    required this.type,
    required this.bank,
    required this.date,
    required this.amount,
    required this.status,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
  });
}
