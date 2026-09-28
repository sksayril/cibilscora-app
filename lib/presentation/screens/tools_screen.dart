import 'package:flutter/material.dart';
import 'tools/score_range_screen.dart';
import 'tools/improve_score_screen.dart';
import 'tools/credit_report_screen.dart';
import 'tools/emi_calculator_screen.dart';
import 'tools/payment_history_screen.dart';
import 'tools/credit_utilization_screen.dart';
import 'tools/credit_age_screen.dart';
import 'tools/enquiries_screen.dart';
import '../widgets/quick_tools_section.dart';

class ToolsScreen extends StatefulWidget {
  final String? initialDetailScreen;

  const ToolsScreen({
    super.key,
    this.initialDetailScreen,
  });

  @override
  State<ToolsScreen> createState() => ToolsScreenState();
}

class ToolsScreenState extends State<ToolsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _fadeAnimation;

  String? activeDetailScreen;

  @override
  void initState() {
    super.initState();
    activeDetailScreen = widget.initialDetailScreen;

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOut,
    );

    _animController.forward();
  }

  @override
  void didUpdateWidget(covariant ToolsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialDetailScreen != oldWidget.initialDetailScreen) {
      setState(() {
        activeDetailScreen = widget.initialDetailScreen;
      });
      _animController.reset();
      _animController.forward();
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void openDetail(String title) {
    setState(() {
      activeDetailScreen = title;
    });
    _animController.reset();
    _animController.forward();
  }

  void closeDetail() {
    setState(() {
      activeDetailScreen = null;
    });
    _animController.reset();
    _animController.forward();
  }

  Widget _buildActiveDetailWidget() {
    switch (activeDetailScreen) {
      case 'Score Range':
        return ScoreRangeScreen(onBackTap: closeDetail);
      case 'Improve Score':
        return ImproveScoreScreen(onBackTap: closeDetail);
      case 'Credit Report':
        return CreditReportScreen(onBackTap: closeDetail);
      case 'EMI Calculator':
        return EmiCalculatorScreen(onBackTap: closeDetail);
      case 'Payment History':
        return PaymentHistoryScreen(onBackTap: closeDetail);
      case 'Credit Utilization':
        return CreditUtilizationScreen(onBackTap: closeDetail);
      case 'Credit Age':
        return CreditAgeScreen(onBackTap: closeDetail);
      case 'Enquiries':
        return EnquiriesScreen(onBackTap: closeDetail);
      default:
        return _buildDashboard();
    }
  }

  Widget _buildDashboard() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quick Tools Section
          QuickToolsSection(
            onToolTap: openDetail,
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: _buildActiveDetailWidget(),
    );
  }
}
