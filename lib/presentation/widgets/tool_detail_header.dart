import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class ToolDetailHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final IconData? actionIcon;
  final VoidCallback? onActionTap;
  final VoidCallback? onBackTap;

  const ToolDetailHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.actionIcon,
    this.onActionTap,
    this.onBackTap,
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
              onPressed: onBackTap ?? () => Navigator.of(context).maybePop(),
              icon: const Icon(
                Icons.arrow_back_rounded,
                size: 24,
                color: AppColors.textDark,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),

            // Title & Subtitle Center
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textMuted,
                      height: 1.0,
                    ),
                  ),
                ],
              ),
            ),

            // Optional Right Action Icon or Empty Placeholder
            if (actionIcon != null)
              IconButton(
                onPressed: onActionTap ?? () {},
                icon: Icon(
                  actionIcon,
                  size: 22,
                  color: AppColors.textDark,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              )
            else
              const SizedBox(width: 24),
          ],
        ),
      ),
    );
  }
}
