import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/services/ad_manager.dart';
import '../../widgets/tool_detail_header.dart';
import 'check_score_loading_screen.dart';

class CheckScoreFormScreen extends StatefulWidget {
  final VoidCallback? onBackTap;

  const CheckScoreFormScreen({
    super.key,
    this.onBackTap,
  });

  @override
  State<CheckScoreFormScreen> createState() => _CheckScoreFormScreenState();
}

class _CheckScoreFormScreenState extends State<CheckScoreFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _panController.dispose();
    _dobController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  Future<void> _selectDateOfBirth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1998, 5, 15),
      firstDate: DateTime(1940),
      lastDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryBlue,
              onPrimary: Colors.white,
              onSurface: AppColors.textDark,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      final formatted =
          '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
      setState(() {
        _dobController.text = formatted;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final pan = _panController.text.trim().toUpperCase();

      AdManager.instance.showRewardedAdWithLoader(
        context,
        onAdDismissed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => CheckScoreLoadingScreen(
                userName: name.isEmpty ? 'Rahul Sharma' : name,
                panNumber: pan,
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolDetailHeader(
        title: 'Check CIBIL Score',
        subtitle: 'Enter your official details to fetch your score.',
        onBackTap: widget.onBackTap ?? () => Navigator.of(context).pop(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main Form Card Container
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFEDF2F7), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF64748B).withValues(alpha: 0.04),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Form Header Badge
                    Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: const BoxDecoration(
                            color: AppColors.toolBlueBg,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.speed_rounded,
                            color: AppColors.primaryBlue,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Instant Bureau Fetch',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Free • Soft Enquiry • No Score Impact',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: AppColors.toolGreenIcon,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    const Divider(height: 1, color: Color(0xFFF1F5F9)),
                    const SizedBox(height: 20),

                    // 1. Full Name Field
                    _inputLabel('Full Name (as per PAN Card)'),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _nameController,
                      textCapitalization: TextCapitalization.words,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                      decoration: _inputDecoration(
                        hintText: 'e.g. Rahul Sharma',
                        icon: Icons.person_outline_rounded,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your full name as per PAN';
                        }
                        if (value.trim().length < 3) {
                          return 'Name must be at least 3 characters';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    // 2. PAN Card Field with Strict Regex Validation
                    _inputLabel('PAN Card Number'),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _panController,
                      textCapitalization: TextCapitalization.characters,
                      maxLength: 10,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                        UpperCaseTextFormatter(),
                      ],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: AppColors.textDark,
                        letterSpacing: 1.5,
                      ),
                      decoration: _inputDecoration(
                        hintText: 'e.g. ABCDE1234F',
                        icon: Icons.badge_outlined,
                      ).copyWith(counterText: ''),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your 10-digit PAN Card Number';
                        }
                        final panUpper = value.trim().toUpperCase();
                        final panRegex = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');
                        if (!panRegex.hasMatch(panUpper)) {
                          return 'Invalid PAN format! (e.g. ABCDE1234F)';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    // 3. Date of Birth Field
                    _inputLabel('Date of Birth'),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _dobController,
                      readOnly: true,
                      onTap: () => _selectDateOfBirth(context),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                      decoration: _inputDecoration(
                        hintText: 'DD / MM / YYYY',
                        icon: Icons.calendar_month_outlined,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please select your date of birth';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    // 4. Mobile Number Field
                    _inputLabel('Mobile Number (for SMS report)'),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _mobileController,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                      decoration: _inputDecoration(
                        hintText: '10-digit mobile number',
                        icon: Icons.phone_android_outlined,
                      ).copyWith(counterText: ''),
                      validator: (value) {
                        if (value != null && value.isNotEmpty && value.length < 10) {
                          return 'Please enter a valid 10-digit mobile number';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Security Guarantee Banner
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.toolBlueBg,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFD6E4FF), width: 1),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.shield_outlined,
                        color: AppColors.primaryBlue,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        '100% Safe & Secure. Checking your score is a soft enquiry and will NOT lower your score.',
                        style: TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textDark,
                          height: 1.35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Submit Action Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    foregroundColor: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Check Score Now',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_rounded, size: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _inputLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 12.5,
        fontWeight: FontWeight.bold,
        color: AppColors.textDark,
      ),
    );
  }

  static InputDecoration _inputDecoration({
    required String hintText,
    required IconData icon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AppColors.textMuted,
      ),
      prefixIcon: Icon(icon, size: 20, color: AppColors.primaryBlue),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      filled: true,
      fillColor: const Color(0xFFF8FAFC),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE2E8F0), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primaryBlue, width: 1.8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 1.8),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
