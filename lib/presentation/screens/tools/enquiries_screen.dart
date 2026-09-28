import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../widgets/tool_detail_header.dart';

class EnquiriesScreen extends StatelessWidget {
  final VoidCallback? onBackTap;

  const EnquiriesScreen({
    super.key,
    this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    final enquiries = [
      _EnquiryItem(
        bank: 'HDFC Bank',
        purpose: 'Personal Loan',
        date: '12 May 2025',
        iconBgColor: AppColors.toolPurpleBg,
        iconColor: AppColors.toolPurpleIcon,
      ),
      _EnquiryItem(
        bank: 'ICICI Bank',
        purpose: 'Credit Card',
        date: '28 Apr 2025',
        iconBgColor: AppColors.toolGreenBg,
        iconColor: AppColors.toolGreenIcon,
      ),
      _EnquiryItem(
        bank: 'Bajaj Finserv',
        purpose: 'Personal Loan',
        date: '10 Mar 2025',
        iconBgColor: AppColors.toolBlueBg,
        iconColor: AppColors.toolBlueIcon,
      ),
    ];

    return Scaffold(
      appBar: ToolDetailHeader(
        title: 'Enquiries',
        subtitle: 'Your recent credit enquiries.',
        actionIcon: Icons.info_outline_rounded,
        onBackTap: onBackTap,
        onActionTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Credit enquiries information...')),
          );
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Total Enquiries Banner Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.toolPurpleBg,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE9D5FF), width: 1),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Total Enquiries',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textMuted,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          '03',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            color: AppColors.toolPurpleIcon,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Last 6 Months',
                          style: TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textMedium,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Search Magnifying Glass Graphic
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.manage_search_rounded,
                      color: AppColors.toolPurpleIcon,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Recent Enquiries',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),

            const SizedBox(height: 14),

            // Recent Enquiries List
            Column(
              children: enquiries.map((item) {
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
                            color: item.iconBgColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              item.bank.substring(0, 1),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: item.iconColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.bank,
                                style: const TextStyle(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textDark,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                item.purpose,
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textMuted,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          item.date,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 8),

            // Bottom Warning Tip Card
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.toolPurpleBg,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFE9D5FF), width: 1),
              ),
              child: Row(
                children: const [
                  Icon(Icons.star_rounded, color: AppColors.toolPurpleIcon, size: 18),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Too many enquiries in a short time can lower your score.',
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.bold,
                        color: AppColors.toolPurpleIcon,
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

class _EnquiryItem {
  final String bank;
  final String purpose;
  final String date;
  final Color iconBgColor;
  final Color iconColor;

  _EnquiryItem({
    required this.bank,
    required this.purpose,
    required this.date,
    required this.iconBgColor,
    required this.iconColor,
  });
}
