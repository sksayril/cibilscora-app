import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../widgets/tool_detail_header.dart';

class EmiCalculatorScreen extends StatefulWidget {
  final VoidCallback? onBackTap;

  const EmiCalculatorScreen({
    super.key,
    this.onBackTap,
  });

  @override
  State<EmiCalculatorScreen> createState() => _EmiCalculatorScreenState();
}

class _EmiCalculatorScreenState extends State<EmiCalculatorScreen> {
  double _loanAmount = 1000000; // 10 Lakhs
  double _interestRate = 8.5; // 8.5%
  double _tenureYears = 5; // 5 Years

  double get _monthlyEmi {
    final p = _loanAmount;
    final r = _interestRate / 12 / 100;
    final n = _tenureYears * 12;
    if (r == 0) return p / n;
    final emi = (p * r * math.pow(1 + r, n)) / (math.pow(1 + r, n) - 1);
    return emi;
  }

  double get _totalPayment => _monthlyEmi * (_tenureYears * 12);
  double get _totalInterest => _totalPayment - _loanAmount;

  String _formatCurrency(double amount) {
    final int val = amount.round();
    final String str = val.toString();
    if (str.length <= 3) return '₹ $str';

    final String lastThree = str.substring(str.length - 3);
    String otherNumbers = str.substring(0, str.length - 3);
    final List<String> result = [];
    while (otherNumbers.length > 2) {
      result.insert(0, otherNumbers.substring(otherNumbers.length - 2));
      otherNumbers = otherNumbers.substring(0, otherNumbers.length - 2);
    }
    if (otherNumbers.isNotEmpty) {
      result.insert(0, otherNumbers);
    }
    return '₹ ${result.join(',')},$lastThree';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolDetailHeader(
        title: 'EMI Calculator',
        subtitle: 'Calculate your loan EMI easily.',
        actionIcon: Icons.refresh_rounded,
        onBackTap: widget.onBackTap,
        onActionTap: () {
          setState(() {
            _loanAmount = 1000000;
            _interestRate = 8.5;
            _tenureYears = 5;
          });
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Segmented Tab Header
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'EMI Calculator',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(height: 2, color: AppColors.primaryBlue),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Affordability',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textMuted,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(height: 1, color: const Color(0xFFE2E8F0)),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 22),

            // 1. Loan Amount Slider
            _sliderGroup(
              title: 'Loan Amount',
              valueText: _formatCurrency(_loanAmount),
              minText: '₹ 50,000',
              maxText: '₹ 1,00,00,000',
              sliderValue: _loanAmount,
              min: 50000,
              max: 10000000,
              divisions: 199,
              onChanged: (val) => setState(() => _loanAmount = val),
            ),

            const SizedBox(height: 20),

            // 2. Interest Rate Slider
            _sliderGroup(
              title: 'Interest Rate (p.a.)',
              valueText: '${_interestRate.toStringAsFixed(2)}%',
              minText: '1%',
              maxText: '30%',
              sliderValue: _interestRate,
              min: 1.0,
              max: 30.0,
              divisions: 290,
              onChanged: (val) => setState(() => _interestRate = val),
            ),

            const SizedBox(height: 20),

            // 3. Loan Tenure Slider
            _sliderGroup(
              title: 'Loan Tenure',
              valueText: '${_tenureYears.toInt()} Years',
              minText: '6 Months',
              maxText: '30 Years',
              sliderValue: _tenureYears,
              min: 0.5,
              max: 30.0,
              divisions: 59,
              onChanged: (val) => setState(() => _tenureYears = val),
            ),

            const SizedBox(height: 24),

            // Result Summary Container Card (Orange Tinted)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.toolOrangeBg,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFFFD8BF), width: 1),
              ),
              child: Column(
                children: [
                  const Text(
                    'Your Monthly EMI',
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold,
                      color: AppColors.toolOrangeIcon,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatCurrency(_monthlyEmi),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: AppColors.textDark,
                    ),
                  ),

                  const SizedBox(height: 18),
                  const Divider(height: 1, color: Color(0xFFFFD8BF)),
                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Interest',
                            style: TextStyle(fontSize: 11, color: AppColors.textMuted),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            _formatCurrency(_totalInterest),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Total Payment',
                            style: TextStyle(fontSize: 11, color: AppColors.textMuted),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            _formatCurrency(_totalPayment),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Amortization Schedule Action
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Opening Amortization Schedule...')),
                      );
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                      child: Row(
                        children: const [
                          Icon(Icons.calendar_month_outlined, size: 16, color: AppColors.toolOrangeIcon),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Amortization Schedule',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: AppColors.toolOrangeIcon,
                              ),
                            ),
                          ),
                          Icon(Icons.chevron_right_rounded, size: 18, color: AppColors.toolOrangeIcon),
                        ],
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

  Widget _sliderGroup({
    required String title,
    required String valueText,
    required String minText,
    required String maxText,
    required double sliderValue,
    required double min,
    required double max,
    required int divisions,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.textMuted,
              ),
            ),
            Text(
              valueText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColors.toolOrangeIcon,
            inactiveTrackColor: const Color(0xFFFFD8BF),
            thumbColor: AppColors.toolOrangeIcon,
            trackHeight: 6,
          ),
          child: Slider(
            value: sliderValue,
            min: min,
            max: max,
            divisions: divisions,
            onChanged: onChanged,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(minText, style: const TextStyle(fontSize: 10.5, color: AppColors.textMuted)),
            Text(maxText, style: const TextStyle(fontSize: 10.5, color: AppColors.textMuted)),
          ],
        ),
      ],
    );
  }
}
