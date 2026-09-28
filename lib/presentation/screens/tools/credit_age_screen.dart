import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../widgets/tool_detail_header.dart';

class CreditAgeScreen extends StatelessWidget {
  final VoidCallback? onBackTap;

  const CreditAgeScreen({
    super.key,
    this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolDetailHeader(
        title: 'Credit Age',
        subtitle: 'Average age of your credit accounts.',
        actionIcon: Icons.info_outline_rounded,
        onBackTap: onBackTap,
        onActionTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Credit Age information...')),
          );
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Average Age Banner Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.toolOrangeBg,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFFFD8BF), width: 1),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Average Credit Age',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textMuted,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          '4 Yrs 6 Mos',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: AppColors.toolOrangeIcon,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Longer credit history positively impacts your score.',
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

                  // Hourglass Graphic Container
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.hourglass_bottom_rounded,
                      color: AppColors.toolOrangeIcon,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Account Age Details',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),

            const SizedBox(height: 14),

            // Account Details Card List
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFEDF2F7), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF64748B).withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _detailItem(Icons.history_rounded, 'Oldest Account', '7 Yrs 2 Mos'),
                  _divider(),
                  _detailItem(Icons.new_releases_outlined, 'Newest Account', '1 Yrs 3 Mos'),
                  _divider(),
                  _detailItem(Icons.access_time_rounded, 'Average Account Age', '4 Yrs 6 Mos'),
                  _divider(),
                  _detailItem(Icons.account_balance_wallet_outlined, 'Total Accounts', '06'),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Bottom Tip Card
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.toolOrangeBg,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFFFD8BF), width: 1),
              ),
              child: Row(
                children: const [
                  Icon(Icons.star_rounded, color: AppColors.toolOrangeIcon, size: 18),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Keep your old accounts active to maintain a good credit age.',
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.bold,
                        color: AppColors.toolOrangeIcon,
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

  static Widget _detailItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.toolOrangeIcon),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _divider() {
    return const Divider(height: 1, thickness: 0.8, indent: 48, endIndent: 16, color: Color(0xFFF1F5F9));
  }
}
