import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class CreditHealthSummary extends StatelessWidget {
  final Function(String title)? onMetricTap;

  const CreditHealthSummary({
    super.key,
    this.onMetricTap,
  });

  @override
  Widget build(BuildContext context) {
    final metrics = [
      _HealthMetricData(
        title: 'Payment History',
        status: 'Good',
        icon: Icons.shield_outlined,
        iconBgColor: AppColors.toolGreenBg,
        iconColor: AppColors.toolGreenIcon,
        statusColor: AppColors.toolGreenIcon,
      ),
      _HealthMetricData(
        title: 'Credit Utilization',
        status: 'Low',
        icon: Icons.pie_chart_outline_rounded,
        iconBgColor: AppColors.toolBlueBg,
        iconColor: AppColors.toolBlueIcon,
        statusColor: AppColors.toolBlueIcon,
      ),
      _HealthMetricData(
        title: 'Credit Age',
        status: 'Good',
        icon: Icons.access_time_rounded,
        iconBgColor: AppColors.toolOrangeBg,
        iconColor: AppColors.toolOrangeIcon,
        statusColor: AppColors.toolOrangeIcon,
      ),
      _HealthMetricData(
        title: 'Enquiries',
        status: 'Low',
        icon: Icons.hourglass_empty_rounded,
        iconBgColor: AppColors.toolPurpleBg,
        iconColor: AppColors.toolPurpleIcon,
        statusColor: AppColors.toolPurpleIcon,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Credit Health Summary',
          style: AppTextStyles.sectionHeading,
        ),
        const SizedBox(height: 14),

        // Main Container Card
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: metrics.map((metric) {
              return Expanded(
                child: InkWell(
                  onTap: () => onMetricTap?.call(metric.title),
                  borderRadius: BorderRadius.circular(12),
                  child: _HealthMetricItem(data: metric),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _HealthMetricData {
  final String title;
  final String status;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final Color statusColor;

  _HealthMetricData({
    required this.title,
    required this.status,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.statusColor,
  });
}

class _HealthMetricItem extends StatelessWidget {
  final _HealthMetricData data;

  const _HealthMetricItem({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Circular Icon
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: data.iconBgColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            data.icon,
            color: data.iconColor,
            size: 22,
          ),
        ),

        const SizedBox(height: 10),

        // Title (Fixed height container for 2 lines alignment)
        SizedBox(
          height: 28,
          child: Center(
            child: Text(
              data.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              softWrap: true,
              style: const TextStyle(
                fontSize: 10.5,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
                height: 1.2,
              ),
            ),
          ),
        ),

        const SizedBox(height: 4),

        // Status Value
        Text(
          data.status,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: data.statusColor,
          ),
        ),
      ],
    );
  }
}
