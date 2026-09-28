import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class GuideHeader extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBackTap;
  final VoidCallback? onHelpTap;

  const GuideHeader({
    super.key,
    this.onBackTap,
    this.onHelpTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Back Arrow Button
            IconButton(
              onPressed: onBackTap ?? () {},
              icon: const Icon(
                Icons.arrow_back_rounded,
                size: 24,
                color: AppColors.textDark,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),

            // Title & Subtitle Center Header
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'CIBIL Score Guide',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                      height: 1.1,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Learn, Understand & Improve Your CIBIL Score',
                    style: TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textMuted,
                      height: 1.0,
                    ),
                  ),
                ],
              ),
            ),

            // Help Question Icon Button
            IconButton(
              onPressed: onHelpTap ?? () {},
              icon: const Icon(
                Icons.help_outline_rounded,
                size: 24,
                color: AppColors.textDark,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    );
  }
}
