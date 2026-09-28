import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/services/ad_manager.dart';

class QuickToolsSection extends StatelessWidget {
  final Function(String toolName)? onToolTap;

  const QuickToolsSection({
    super.key,
    this.onToolTap,
  });

  void _handleToolClick(BuildContext context, String toolTitle) {
    AdManager.instance.showRewardedAdWithLoader(
      context,
      onAdDismissed: () => onToolTap?.call(toolTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tools = [
      _QuickToolData(
        title: 'Score Range',
        subtitle: '300 – 900',
        icon: Icons.speed_rounded,
        iconBgColor: AppColors.toolBlueBg,
        iconColor: AppColors.toolBlueIcon,
      ),
      _QuickToolData(
        title: 'Improve Score',
        subtitle: 'Tips',
        icon: Icons.trending_up_rounded,
        iconBgColor: AppColors.toolGreenBg,
        iconColor: AppColors.toolGreenIcon,
      ),
      _QuickToolData(
        title: 'Credit Report',
        subtitle: 'Summary',
        icon: Icons.description_outlined,
        iconBgColor: AppColors.toolPurpleBg,
        iconColor: AppColors.toolPurpleIcon,
      ),
      _QuickToolData(
        title: 'EMI Calculator',
        subtitle: 'Calculate EMI',
        icon: Icons.calculate_outlined,
        iconBgColor: AppColors.toolOrangeBg,
        iconColor: AppColors.toolOrangeIcon,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Tools',
          style: AppTextStyles.sectionHeading,
        ),
        const SizedBox(height: 14),

        // 2x2 Grid Layout (2 tools per row)
        Column(
          children: [
            // Row 1: Score Range & Improve Score
            Row(
              children: [
                Expanded(
                  child: _QuickToolCard(
                    data: tools[0],
                    onTap: () => _handleToolClick(context, tools[0].title),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _QuickToolCard(
                    data: tools[1],
                    onTap: () => _handleToolClick(context, tools[1].title),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Row 2: Credit Report & EMI Calculator
            Row(
              children: [
                Expanded(
                  child: _QuickToolCard(
                    data: tools[2],
                    onTap: () => _handleToolClick(context, tools[2].title),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _QuickToolCard(
                    data: tools[3],
                    onTap: () => _handleToolClick(context, tools[3].title),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _QuickToolData {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;

  _QuickToolData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
  });
}

class _QuickToolCard extends StatefulWidget {
  final _QuickToolData data;
  final VoidCallback onTap;

  const _QuickToolCard({
    required this.data,
    required this.onTap,
  });

  @override
  State<_QuickToolCard> createState() => _QuickToolCardState();
}

class _QuickToolCardState extends State<_QuickToolCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _isPressed ? 0.96 : 1.0,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeInOut,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
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
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Circular Icon Container
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: widget.data.iconBgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  widget.data.icon,
                  color: widget.data.iconColor,
                  size: 24,
                ),
              ),

              const SizedBox(height: 12),

              // Title
              Text(
                widget.data.title,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),

              const SizedBox(height: 4),

              // Subtitle
              Text(
                widget.data.subtitle,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
