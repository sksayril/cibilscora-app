import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../widgets/tool_detail_header.dart';

class CreditReportScreen extends StatelessWidget {
  final VoidCallback? onBackTap;

  const CreditReportScreen({
    super.key,
    this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolDetailHeader(
        title: 'Credit Report Guide',
        subtitle: 'Everything you need to know about CIBIL Reports.',
        onBackTap: onBackTap ?? () => Navigator.of(context).pop(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Hero Intro Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6366F1), Color(0xFF4F46E5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF4F46E5).withValues(alpha: 0.25),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.description_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'What Is a CIBIL Report?\nComplete Guide',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            height: 1.25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'A CIBIL Report is a credit information report that contains details related to your credit and loan activities. It can help lenders understand your credit history and repayment behaviour. If you have previously taken a loan or used a credit card, information related to those credit activities may form part of your credit history.',
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFE0E7FF),
                      height: 1.45,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // 2. Section 1: What Does a CIBIL Report Include?
            _sectionHeader('1. What Does a CIBIL Report Include?', Icons.fact_check_outlined),
            const SizedBox(height: 10),
            const Text(
              'A credit report generally contains information related to your credit history. This may include credit accounts, loan accounts, repayment records, and credit enquiries.',
              style: TextStyle(fontSize: 12.5, color: AppColors.textMuted, height: 1.4),
            ),
            const SizedBox(height: 14),

            _includeCard(
              title: 'Personal Information',
              subtitle:
                  'Contains basic identification details such as your name, date of birth, contact details, and address to match credit records with the correct individual.',
              icon: Icons.person_outline_rounded,
              bgColor: const Color(0xFFEEF2FF),
              iconColor: const Color(0xFF4F46E5),
            ),
            const SizedBox(height: 10),
            _includeCard(
              title: 'Credit Accounts',
              subtitle:
                  'Information about credit cards and loan accounts (personal, home, vehicle). Shows active credit accounts and reported statuses.',
              icon: Icons.credit_card_outlined,
              bgColor: const Color(0xFFFEF3C7),
              iconColor: const Color(0xFFD97706),
            ),
            const SizedBox(height: 10),
            _includeCard(
              title: 'Payment History',
              subtitle:
                  'Repayment behaviour records. On-time payments maintain healthy credit, while delayed or missed payments negatively affect your profile.',
              icon: Icons.history_rounded,
              bgColor: const Color(0xFFDCFCE7),
              iconColor: const Color(0xFF16A34A),
            ),
            const SizedBox(height: 10),
            _includeCard(
              title: 'Outstanding Balance',
              subtitle:
                  'The remaining balance on credit accounts. High outstanding debt indicates greater financial obligations that need responsible management.',
              icon: Icons.account_balance_wallet_outlined,
              bgColor: const Color(0xFFF3E8FF),
              iconColor: const Color(0xFF9333EA),
            ),
            const SizedBox(height: 10),
            _includeCard(
              title: 'Credit Utilization',
              subtitle:
                  'Refers to how much available credit limit is being used. Using a large portion of available limit is not ideal; balanced use is key.',
              icon: Icons.pie_chart_outline_rounded,
              bgColor: const Color(0xFFE0F2FE),
              iconColor: const Color(0xFF0284C7),
            ),
            const SizedBox(height: 10),
            _includeCard(
              title: 'Credit Enquiries',
              subtitle:
                  'Recorded when you apply for a loan or card. Applying for credit repeatedly in a short period may be considered an additional risk factor.',
              icon: Icons.search_rounded,
              bgColor: const Color(0xFFFFE4E6),
              iconColor: const Color(0xFFE11D48),
            ),

            const SizedBox(height: 24),

            // 3. Section 2: Difference Between CIBIL Report & Credit Score
            _sectionHeader('2. Difference: Report vs Score', Icons.compare_arrows_rounded),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
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
                  Row(
                    children: [
                      Expanded(
                        child: _comparisonBadge(
                          title: 'Credit Score',
                          desc: 'Numerical indication (300-900) providing a summary of credit history.',
                          color: AppColors.primaryBlue,
                          bgColor: AppColors.toolBlueBg,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _comparisonBadge(
                          title: 'Credit Report',
                          desc: 'Detailed record containing accounts, payment history & enquiries.',
                          color: const Color(0xFF9333EA),
                          bgColor: const Color(0xFFF3E8FF),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'In simple words:',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textDark,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          '• Credit Score = A numerical summary of your credit profile\n• Credit Report = Detailed information about your credit history',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryBlue,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 4. Section 3: Why Is It Important to Check Your Credit Report?
            _sectionHeader('3. Why Check Your Credit Report?', Icons.lightbulb_outline_rounded),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Understanding your credit information is essential:',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _bulletPoint('Reviewing your report helps verify all active credit accounts and reported information.'),
                  _bulletPoint('If you notice incorrect or unfamiliar information, you can follow official processes to raise a dispute.'),
                  _bulletPoint('Regular reviews help maintain responsible financial habits and prevent unauthorized accounts.'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 5. Section 4: How Can You Maintain a Better Credit Profile?
            _sectionHeader('4. Maintain a Better Credit Profile', Icons.verified_user_outlined),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF0FDF4),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFBBF7D0), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'General habits to maintain a healthy profile:',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF166534),
                    ),
                  ),
                  SizedBox(height: 12),
                  _CheckItem('Pay your EMIs and credit card bills on time.'),
                  _CheckItem('Manage outstanding balances responsibly.'),
                  _CheckItem('Use your available credit limit in a balanced manner.'),
                  _CheckItem('Avoid applying for loans or credit cards unnecessarily.'),
                  _CheckItem('Manage existing and active credit accounts responsibly.'),
                  _CheckItem('Review credit information periodically through official sources.'),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  static Widget _sectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.primaryBlue),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 15.5,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
        ),
      ],
    );
  }

  static Widget _includeCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color bgColor,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEDF2F7), width: 1),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF64748B).withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textMuted,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _comparisonBadge({
    required String title,
    required String desc,
    required Color color,
    required Color bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.2), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            desc,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _bulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primaryBlue)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.textDark,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckItem extends StatelessWidget {
  final String text;
  const _CheckItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle_rounded, color: Color(0xFF16A34A), size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF14532D),
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
