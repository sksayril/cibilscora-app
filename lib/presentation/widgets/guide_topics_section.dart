import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'topic_detail_modal.dart';

class GuideTopicsSection extends StatelessWidget {
  final Function(String topicTitle)? onTopicTap;

  const GuideTopicsSection({
    super.key,
    this.onTopicTap,
  });

  void _showTopicDetails(BuildContext context, String title) {
    switch (title) {
      case 'What is CIBIL Score?':
        TopicDetailModal.show(
          context,
          title: 'What is CIBIL Score?',
          subtitle: 'Understand what CIBIL score is and why it matters.',
          impactText: 'Core Knowledge • Score Range 300-900',
          description:
              'A CIBIL Score is a 3-digit numerical summary (ranging from 300 to 900) of your credit history compiled by TransUnion CIBIL. It reflects your creditworthiness and loan repayment likelihood.',
          actionSteps: [
            'A score of 750 or above is considered good by most banks.',
            'Lenders evaluate your score before approving loans or credit cards.',
            'Higher scores unlock lower interest rates and faster approvals.',
          ],
          proTip:
              'A score above 750 unlocks pre-approved credit cards and low-interest loan offers!',
          icon: Icons.trending_up_rounded,
          iconBgColor: AppColors.toolBlueBg,
          iconColor: AppColors.toolBlueIcon,
        );
        break;

      case 'Factors That Affect Score':
        TopicDetailModal.show(
          context,
          title: 'Factors That Affect Score',
          subtitle: 'Explore the key factors that impact your credit score.',
          impactText: '5 Core Weightage Factors',
          description:
              'Five main factors determine your CIBIL score: Payment History (35%), Credit Utilization (30%), Credit History Length (15%), Credit Mix (10%), and New Enquiries (10%).',
          actionSteps: [
            'Payment History (35%): Always pay EMIs and card bills on time.',
            'Credit Utilization (30%): Keep credit card usage below 30%.',
            'Credit Mix (10%): Maintain a healthy balance of secured and unsecured credit.',
          ],
          proTip:
              'Focusing on Payment History & Credit Utilization covers 65% of your total credit score!',
          icon: Icons.pie_chart_rounded,
          iconBgColor: AppColors.toolGreenBg,
          iconColor: AppColors.toolGreenIcon,
        );
        break;

      case 'How to Improve Score':
        TopicDetailModal.show(
          context,
          title: 'How to Improve Score',
          subtitle: 'Practical tips and proven ways to improve your score.',
          impactText: 'Actionable 90-Day Strategy',
          description:
              'Improving your credit score requires discipline and consistent financial habits over 3 to 6 months.',
          actionSteps: [
            'Clear all pending overdue bill payments immediately.',
            'Pay down credit card balances to reduce your utilization ratio.',
            'Avoid applying for multiple new credit cards simultaneously.',
          ],
          proTip:
              'Credit scores update every 30-45 days when financial institutions report data to CIBIL!',
          icon: Icons.lightbulb_outline_rounded,
          iconBgColor: AppColors.toolOrangeBg,
          iconColor: AppColors.toolOrangeIcon,
        );
        break;

      case 'Score Range Explained':
        TopicDetailModal.show(
          context,
          title: 'Score Range Explained',
          subtitle: 'Know the different score ranges and what they mean.',
          impactText: 'Range Category Guide',
          description:
              'Scores range from 300 to 900 and are categorized into 5 tiers: Poor (300-549), Average (550-649), Good (650-749), Very Good (750-799), and Excellent (800-900).',
          actionSteps: [
            'Poor (300-549): High risk, credit applications usually rejected.',
            'Good (650-749): Moderate risk, loan approvals probable.',
            'Excellent (800-900): Lowest risk, best rates & premium benefits.',
          ],
          proTip:
              'Moving from Good (650+) to Very Good (750+) unlocks maximum financial benefits!',
          icon: Icons.tune_rounded,
          iconBgColor: AppColors.toolPurpleBg,
          iconColor: AppColors.toolPurpleIcon,
        );
        break;

      case 'Common Myths':
        TopicDetailModal.show(
          context,
          title: 'Common Myths',
          subtitle: "Don't fall for these common credit score myths.",
          impactText: 'Myth Debunking Guide',
          description:
              'Many credit myths cause unnecessary worry. Understanding facts helps you manage your credit without fear.',
          actionSteps: [
            'Myth 1: Checking your own score lowers it (Fact: Self-checks are Soft Enquiries with 0 impact).',
            'Myth 2: Income affects CIBIL score (Fact: Income is not included in score calculations).',
            'Myth 3: Closing old cards boosts score (Fact: Closing old cards can actually reduce average credit age).',
          ],
          proTip:
              'Check your own CIBIL score as often as you like — self-checks are completely free and safe!',
          icon: Icons.article_outlined,
          iconBgColor: const Color(0xFFFCE8E6),
          iconColor: const Color(0xFFE53935),
        );
        break;

      case 'Best Practices':
        TopicDetailModal.show(
          context,
          title: 'Best Practices',
          subtitle: 'Good credit habits for a strong financial future.',
          impactText: 'Long-Term Financial Blueprint',
          description:
              'Adopting best credit practices guarantees a robust credit score throughout your financial journey.',
          actionSteps: [
            'Enable auto-pay for all recurring bill and EMI payments.',
            'Periodically inspect your official CIBIL report for errors.',
            'Keep long-standing credit accounts active and well-managed.',
          ],
          proTip:
              'Financial discipline today builds a stress-free financial future tomorrow!',
          icon: Icons.verified_outlined,
          iconBgColor: const Color(0xFFE0F2F1),
          iconColor: const Color(0xFF00897B),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final topics = [
      _GuideTopicData(
        title: 'What is CIBIL Score?',
        subtitle: 'Understand what CIBIL score is and why it matters.',
        icon: Icons.trending_up_rounded,
        iconBgColor: AppColors.toolBlueBg,
        iconColor: AppColors.toolBlueIcon,
      ),
      _GuideTopicData(
        title: 'Factors That Affect Score',
        subtitle: 'Explore the key factors that impact your credit score.',
        icon: Icons.pie_chart_rounded,
        iconBgColor: AppColors.toolGreenBg,
        iconColor: AppColors.toolGreenIcon,
      ),
      _GuideTopicData(
        title: 'How to Improve Score',
        subtitle: 'Practical tips and proven ways to improve your score.',
        icon: Icons.lightbulb_outline_rounded,
        iconBgColor: AppColors.toolOrangeBg,
        iconColor: AppColors.toolOrangeIcon,
      ),
      _GuideTopicData(
        title: 'Score Range Explained',
        subtitle: 'Know the different score ranges and what they mean.',
        icon: Icons.tune_rounded,
        iconBgColor: AppColors.toolPurpleBg,
        iconColor: AppColors.toolPurpleIcon,
      ),
      _GuideTopicData(
        title: 'Common Myths',
        subtitle: "Don't fall for these common credit score myths.",
        icon: Icons.article_outlined,
        iconBgColor: const Color(0xFFFCE8E6),
        iconColor: const Color(0xFFE53935),
      ),
      _GuideTopicData(
        title: 'Best Practices',
        subtitle: 'Good credit habits for a strong financial future.',
        icon: Icons.verified_outlined,
        iconBgColor: const Color(0xFFE0F2F1),
        iconColor: const Color(0xFF00897B),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Explore Guide Topics Header
        Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: const BoxDecoration(
                color: AppColors.toolPurpleBg,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.menu_book_rounded,
                color: AppColors.toolPurpleIcon,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Explore Guide Topics',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Everything you need to know about CIBIL Score',
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 16),

        // List of 6 Topic Cards
        Column(
          children: topics.map((topic) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _GuideTopicCard(
                data: topic,
                onTap: () {
                  onTopicTap?.call(topic.title);
                  _showTopicDetails(context, topic.title);
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _GuideTopicData {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;

  _GuideTopicData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
  });
}

class _GuideTopicCard extends StatefulWidget {
  final _GuideTopicData data;
  final VoidCallback onTap;

  const _GuideTopicCard({
    required this.data,
    required this.onTap,
  });

  @override
  State<_GuideTopicCard> createState() => _GuideTopicCardState();
}

class _GuideTopicCardState extends State<_GuideTopicCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _isPressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeInOut,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
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
          child: Row(
            children: [
              // Icon Container
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: widget.data.iconBgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  widget.data.icon,
                  color: widget.data.iconColor,
                  size: 22,
                ),
              ),

              const SizedBox(width: 14),

              // Title & Subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      widget.data.subtitle,
                      style: const TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),

              // Chevron Right Arrow
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.textDark,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
