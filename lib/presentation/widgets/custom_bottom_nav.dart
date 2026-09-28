import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // 0: Home
              _NavItem(
                index: 0,
                currentIndex: currentIndex,
                label: 'Home',
                icon: Icons.home_rounded,
                selectedIcon: Icons.home_rounded,
                onTap: onTap,
              ),

              // 1: Guide
              _NavItem(
                index: 1,
                currentIndex: currentIndex,
                label: 'Guide',
                icon: Icons.menu_book_outlined,
                selectedIcon: Icons.menu_book_rounded,
                onTap: onTap,
              ),

              // 2: Center Elevated "Check Score"
              GestureDetector(
                onTap: () => onTap(2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      margin: const EdgeInsets.only(bottom: 2),
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryBlue.withValues(alpha: 0.4),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.speed_rounded,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                    Text(
                      'Check Score',
                      style: TextStyle(
                        fontSize: 10.5,
                        fontWeight: currentIndex == 2 ? FontWeight.bold : FontWeight.w500,
                        color: currentIndex == 2 ? AppColors.navSelected : AppColors.navUnselected,
                      ),
                    ),
                  ],
                ),
              ),

              // 3: Tools
              _NavItem(
                index: 3,
                currentIndex: currentIndex,
                label: 'Tools',
                icon: Icons.grid_view_outlined,
                selectedIcon: Icons.grid_view_rounded,
                onTap: onTap,
              ),

              // 4: Profile
              _NavItem(
                index: 4,
                currentIndex: currentIndex,
                label: 'Profile',
                icon: Icons.person_outline_rounded,
                selectedIcon: Icons.person_rounded,
                onTap: onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final ValueChanged<int> onTap;

  const _NavItem({
    required this.index,
    required this.currentIndex,
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = index == currentIndex;

    return InkWell(
      onTap: () => onTap(index),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isSelected ? selectedIcon : icon,
            color: isSelected ? AppColors.navSelected : AppColors.navUnselected,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected ? AppColors.navSelected : AppColors.navUnselected,
            ),
          ),
        ],
      ),
    );
  }
}
