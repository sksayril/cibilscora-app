import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../widgets/tool_detail_header.dart';
import '../../widgets/topic_detail_modal.dart';

class ImproveScoreScreen extends StatelessWidget {
  final VoidCallback? onBackTap;

  const ImproveScoreScreen({
    super.key,
    this.onBackTap,
  });

  void _showTipDetails(BuildContext context, String title) {
    switch (title) {
      case 'Pay Bills on Time':
        TopicDetailModal.show(
          context,
          title: 'Pay Bills on Time',
          subtitle: 'Make payments before the due date.',
          impactText: 'High Impact • 35% Score Weightage',
          description:
              'Payment history is the single largest factor affecting your CIBIL score. Paying credit card bills and loan EMIs on time builds strong creditworthiness.',
          actionSteps: [
            'Set up auto-debit for monthly credit card bills and EMIs.',
            'Never delay payments past 30 days to avoid negative DPD entries.',
            'Pay total amount due instead of just the minimum amount.',
          ],
          proTip:
              'Consistently paying bills on time for 6+ months can boost your score by up to 50 points!',
          icon: Icons.receipt_long_rounded,
          iconBgColor: AppColors.toolGreenBg,
          iconColor: AppColors.toolGreenIcon,
        );
        break;

      case 'Reduce Credit Utilization':
        TopicDetailModal.show(
          context,
          title: 'Reduce Credit Utilization',
          subtitle: 'Keep your credit utilization below 30%.',
          impactText: 'High Impact • 30% Score Weightage',
          description:
              'Credit utilization is the ratio of your active credit card balance to your total credit limit. Keeping it under 30% shows responsible borrowing.',
          actionSteps: [
            'Keep total credit card usage under 30% of total limit.',
            'Request a credit limit increase to lower your utilization ratio.',
            'Pay credit card balances twice a month before statement billing date.',
          ],
          proTip:
              'High utilization above 70% can lower your score even if you pay in full every month!',
          icon: Icons.trending_down_rounded,
          iconBgColor: AppColors.toolGreenBg,
          iconColor: AppColors.toolGreenIcon,
        );
        break;

      case 'Avoid Multiple Enquiries':
        TopicDetailModal.show(
          context,
          title: 'Avoid Multiple Enquiries',
          subtitle: 'Too many enquiries can lower your score.',
          impactText: 'Medium Impact • 10% Score Weightage',
          description:
              'Hard enquiries occur when you apply for new credit cards or loans. Multiple applications in a short period make you look credit-hungry.',
          actionSteps: [
            'Space out loan and credit card applications by at least 3-6 months.',
            'Check pre-approved credit offers instead of filing new applications.',
            'Avoid applying for credit from multiple lenders simultaneously.',
          ],
          proTip:
              'Checking your own credit score is a Soft Enquiry and does NOT lower your score!',
          icon: Icons.search_rounded,
          iconBgColor: AppColors.toolOrangeBg,
          iconColor: AppColors.toolOrangeIcon,
        );
        break;

      case 'Maintain Old Accounts':
        TopicDetailModal.show(
          context,
          title: 'Maintain Old Accounts',
          subtitle: 'Older accounts increase the average credit age.',
          impactText: 'Medium Impact • 15% Score Weightage',
          description:
              'The length of your credit history demonstrates long-term financial reliability. Older accounts increase your average credit account age.',
          actionSteps: [
            'Keep your oldest credit card account active even if rarely used.',
            'Make small annual purchases on old cards to keep them active.',
            'Avoid closing old zero-fee credit card accounts.',
          ],
          proTip:
              'Closing your oldest credit card reduces your average credit age, which can lower your score!',
          icon: Icons.account_balance_wallet_outlined,
          iconBgColor: AppColors.toolPurpleBg,
          iconColor: AppColors.toolPurpleIcon,
        );
        break;

      case 'Check Credit Report Regularly':
        TopicDetailModal.show(
          context,
          title: 'Check Credit Report Regularly',
          subtitle: 'Monitor your report and fix errors if any.',
          impactText: 'High Priority Maintenance',
          description:
              'Regularly reviewing your CIBIL report helps you catch reporting errors, fraudulent accounts, or incorrect payment statuses early.',
          actionSteps: [
            'Review your official CIBIL report quarterly.',
            'Immediately dispute clerical errors or unauthorized accounts online.',
            'Track your score progress over time to stay on target.',
          ],
          proTip:
              'Over 20% of credit reports contain errors that can be quickly rectified via online dispute!',
          icon: Icons.stars_rounded,
          iconBgColor: const Color(0xFFFFF8E1),
          iconColor: const Color(0xFFF57F17),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tips = [
      _TipItemData(
        title: 'Pay Bills on Time',
        subtitle: 'Make payments before the due date.',
        icon: Icons.receipt_long_rounded,
        iconBgColor: AppColors.toolGreenBg,
        iconColor: AppColors.toolGreenIcon,
      ),
      _TipItemData(
        title: 'Reduce Credit Utilization',
        subtitle: 'Keep your credit utilization below 30%.',
        icon: Icons.trending_down_rounded,
        iconBgColor: AppColors.toolGreenBg,
        iconColor: AppColors.toolGreenIcon,
      ),
      _TipItemData(
        title: 'Avoid Multiple Enquiries',
        subtitle: 'Too many enquiries can lower your score.',
        icon: Icons.search_rounded,
        iconBgColor: AppColors.toolOrangeBg,
        iconColor: AppColors.toolOrangeIcon,
      ),
      _TipItemData(
        title: 'Maintain Old Accounts',
        subtitle: 'Older accounts increase the average credit age.',
        icon: Icons.account_balance_wallet_outlined,
        iconBgColor: AppColors.toolPurpleBg,
        iconColor: AppColors.toolPurpleIcon,
      ),
      _TipItemData(
        title: 'Check Credit Report Regularly',
        subtitle: 'Monitor your report and fix errors if any.',
        icon: Icons.stars_rounded,
        iconBgColor: const Color(0xFFFFF8E1),
        iconColor: const Color(0xFFF57F17),
      ),
    ];

    return Scaffold(
      appBar: ToolDetailHeader(
        title: 'Improve Score',
        subtitle: 'Smart tips to improve your CIBIL score.',
        onBackTap: onBackTap,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Score Overview Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.toolGreenBg,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFC6F6D5), width: 1),
              ),
              child: Column(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.track_changes_rounded,
                      color: AppColors.primaryBlue,
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Your Score ',
                        style: TextStyle(fontSize: 13, color: AppColors.textMuted),
                      ),
                      Text(
                        '782 ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: AppColors.textDark,
                        ),
                      ),
                      Text(
                        '/ 900',
                        style: TextStyle(fontSize: 14, color: AppColors.textMuted),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.toolGreenIcon,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Good',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Keep going! You're on the right track.",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textMedium,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Top Tips to Improve',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),

            const SizedBox(height: 14),

            // List of Tips with interactive tap modal
            Column(
              children: tips.map((tip) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    onTap: () => _showTipDetails(context, tip.title),
                    borderRadius: BorderRadius.circular(16),
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
                              color: tip.iconBgColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(tip.icon, color: tip.iconColor, size: 22),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tip.title,
                                  style: const TextStyle(
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textDark,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  tip.subtitle,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textMuted,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.chevron_right_rounded,
                            color: AppColors.textDark,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 8),

            // Bottom Consistency Banner
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF5EBFB),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFE9D5FF), width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.star_rounded, color: AppColors.toolPurpleIcon, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'Consistency is the key to a good score!',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.toolPurpleIcon,
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

class _TipItemData {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;

  _TipItemData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
  });
}
