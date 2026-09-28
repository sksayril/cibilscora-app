import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_colors.dart';
import 'topic_detail_modal.dart';

class ProfileMenuList extends StatelessWidget {
  final Function(String title)? onItemTap;

  const ProfileMenuList({
    super.key,
    this.onItemTap,
  });

  static const String _privacyPolicyUrl =
      'https://sites.google.com/view/cibil-score-guide/home';
  static const String _termsUrl =
      'https://sites.google.com/view/cibiltc/home';

  Future<void> _launchExternalUrl(BuildContext context, String urlString) async {
    final Uri uri = Uri.parse(urlString);
    try {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not open link: $urlString')),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error opening link: $e')),
        );
      }
    }
  }

  void _handleMenuSelection(BuildContext context, String title) {
    switch (title) {
      case 'Credit Report':
      case 'Score Range Guide':
      case 'Tips to Improve Score':
      case 'EMI Calculator':
        onItemTap?.call(title);
        break;

      case 'Credit Card Guide':
        TopicDetailModal.show(
          context,
          title: 'Credit Card Guide',
          subtitle: 'Learn about credit cards and usage',
          impactText: 'Credit Card Best Practices',
          description:
              'Learn how to leverage credit cards effectively to earn reward points, cashbacks, and build an exceptional CIBIL score.',
          actionSteps: [
            'Pay total statement balance in full every month to avoid interest.',
            'Never withdraw cash using credit cards.',
            'Utilize card rewards and cashback benefits efficiently.',
          ],
          proTip:
              'Using a credit card responsibly and paying in full is the fastest way to build credit from scratch!',
          icon: Icons.credit_card_outlined,
          iconBgColor: const Color(0xFFFCE8E6),
          iconColor: const Color(0xFFE53935),
        );
        break;

      case 'Loan Eligibility':
        TopicDetailModal.show(
          context,
          title: 'Loan Eligibility',
          subtitle: 'Check your loan eligibility',
          impactText: 'Lender Eligibility Criteria',
          description:
              'Understand the key factors banks inspect when evaluating your loan eligibility and maximum loan sanction amount.',
          actionSteps: [
            'CIBIL Score: 750+ ensures smooth approval.',
            'FOIR Ratio: Total existing EMIs should be under 50% of net monthly income.',
            'Employment Stability: Minimum 1-2 years of continuous work history.',
          ],
          proTip:
              'Clearing small existing loans before applying increases your maximum loan eligibility!',
          icon: Icons.account_balance_outlined,
          iconBgColor: const Color(0xFFE0F2F1),
          iconColor: const Color(0xFF00897B),
        );
        break;

      case 'Privacy Policy':
        _launchExternalUrl(context, _privacyPolicyUrl);
        break;

      case 'Terms & Conditions':
        _launchExternalUrl(context, _termsUrl);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      _ProfileMenuItemData(
        title: 'Credit Report',
        subtitle: 'View and analyze your credit report',
        icon: Icons.description_outlined,
        iconBgColor: AppColors.toolPurpleBg,
        iconColor: AppColors.toolPurpleIcon,
      ),
      _ProfileMenuItemData(
        title: 'Score Range Guide',
        subtitle: 'Understand score ranges in detail',
        icon: Icons.bar_chart_rounded,
        iconBgColor: AppColors.toolGreenBg,
        iconColor: AppColors.toolGreenIcon,
      ),
      _ProfileMenuItemData(
        title: 'Tips to Improve Score',
        subtitle: 'Best tips to improve your CIBIL score',
        icon: Icons.lightbulb_outline_rounded,
        iconBgColor: AppColors.toolOrangeBg,
        iconColor: AppColors.toolOrangeIcon,
      ),
      _ProfileMenuItemData(
        title: 'EMI Calculator',
        subtitle: 'Calculate your loan EMI easily',
        icon: Icons.calculate_outlined,
        iconBgColor: AppColors.toolBlueBg,
        iconColor: AppColors.toolBlueIcon,
      ),
      _ProfileMenuItemData(
        title: 'Credit Card Guide',
        subtitle: 'Learn about credit cards and usage',
        icon: Icons.credit_card_outlined,
        iconBgColor: const Color(0xFFFCE8E6),
        iconColor: const Color(0xFFE53935),
      ),
      _ProfileMenuItemData(
        title: 'Loan Eligibility',
        subtitle: 'Check your loan eligibility',
        icon: Icons.account_balance_outlined,
        iconBgColor: const Color(0xFFE0F2F1),
        iconColor: const Color(0xFF00897B),
      ),
      _ProfileMenuItemData(
        title: 'Privacy Policy',
        subtitle: 'Read our privacy policy',
        icon: Icons.shield_outlined,
        iconBgColor: AppColors.toolBlueBg,
        iconColor: AppColors.toolBlueIcon,
      ),
      _ProfileMenuItemData(
        title: 'Terms & Conditions',
        subtitle: 'Read our terms and conditions',
        icon: Icons.article_outlined,
        iconBgColor: AppColors.toolPurpleBg,
        iconColor: AppColors.toolPurpleIcon,
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFEDF2F7),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF64748B).withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: List.generate(menuItems.length, (index) {
          final item = menuItems[index];
          final isLast = index == menuItems.length - 1;

          return Column(
            children: [
              InkWell(
                onTap: () => _handleMenuSelection(context, item.title),
                borderRadius: BorderRadius.vertical(
                  top: index == 0 ? const Radius.circular(20) : Radius.zero,
                  bottom: isLast ? const Radius.circular(20) : Radius.zero,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  child: Row(
                    children: [
                      // Icon Circle
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: item.iconBgColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          item.icon,
                          color: item.iconColor,
                          size: 22,
                        ),
                      ),

                      const SizedBox(width: 14),

                      // Text Title & Subtitle
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              item.subtitle,
                              style: const TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textMuted,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Chevron Right Arrow or External Link Icon for URLs
                      Icon(
                        (item.title == 'Privacy Policy' || item.title == 'Terms & Conditions')
                            ? Icons.open_in_new_rounded
                            : Icons.chevron_right_rounded,
                        color: (item.title == 'Privacy Policy' || item.title == 'Terms & Conditions')
                            ? AppColors.primaryBlue
                            : AppColors.textDark,
                        size: (item.title == 'Privacy Policy' || item.title == 'Terms & Conditions')
                            ? 18
                            : 22,
                      ),
                    ],
                  ),
                ),
              ),

              if (!isLast)
                const Divider(
                  height: 1,
                  thickness: 0.8,
                  indent: 72,
                  endIndent: 16,
                  color: Color(0xFFF1F5F9),
                ),
            ],
          );
        }),
      ),
    );
  }
}

class _ProfileMenuItemData {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;

  _ProfileMenuItemData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
  });
}
