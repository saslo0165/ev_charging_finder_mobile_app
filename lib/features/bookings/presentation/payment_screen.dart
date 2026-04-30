import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/gap.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Payment',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap.h16,
                  const _BookingSummaryCard(),
                  Gap.h32,
                  const Text(
                    'Payment Methods',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Gap.h16,
                  const _PaymentOption(
                    icon: Icons.credit_card_rounded,
                    title: 'Credit / Debit Card',
                    subtitle: '•••• •••• •••• 4582',
                    isSelected: true,
                  ),
                  Gap.h12,
                  const _PaymentOption(
                    icon: Icons.account_balance_wallet_rounded,
                    title: 'Google Pay / UPI',
                    subtitle: 'alex@okaxis',
                    isSelected: false,
                  ),
                  Gap.h12,
                  const _PaymentOption(
                    icon: Icons.wallet_rounded,
                    title: 'Wallet',
                    subtitle: 'Balance: ₹1,250.00',
                    isSelected: false,
                  ),
                  Gap.h24,
                  _AddPaymentMethodButton(),
                ],
              ),
            ),
          ),
          _PaymentFooter(
            onPressed: () => context.pushReplacement('/booking-success'),
          ),
        ],
      ),
    );
  }
}

class _BookingSummaryCard extends StatelessWidget {
  const _BookingSummaryCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.outline.withValues(alpha: 0.5)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.ev_station_rounded, color: AppColors.primary),
              ),
              Gap.w12,
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'EV Charging Sarkhej',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      'Ahmedabad, India',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 32),
          const _SummaryRow(label: 'Connector', value: 'CCS 2 (Level 3)'),
          Gap.h12,
          const _SummaryRow(label: 'Date', value: '22 April 2026'),
          Gap.h12,
          const _SummaryRow(label: 'Time Slot', value: '10:00 AM - 11:00 AM'),
          const Divider(height: 32),
          const _SummaryRow(
            label: 'Total Amount',
            value: '₹240.00',
            isBold: true,
            valueColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.isBold = false,
    this.valueColor,
  });

  final String label;
  final String value;
  final bool isBold;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        Text(
          value,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            fontSize: isBold ? 16 : 14,
            color: valueColor ?? Colors.black,
          ),
        ),
      ],
    );
  }
}

class _PaymentOption extends StatelessWidget {
  const _PaymentOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary.withValues(alpha: 0.05) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.outline,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary.withValues(alpha: 0.1) : AppColors.surface,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: isSelected ? AppColors.primary : Colors.black54, size: 20),
          ),
          Gap.w16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          if (isSelected)
            const Icon(Icons.check_circle_rounded, color: AppColors.primary, size: 24),
        ],
      ),
    );
  }
}

class _AddPaymentMethodButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outline, style: BorderStyle.solid),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_rounded, size: 20),
          Gap.w8,
          Text('Add New Method', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _PaymentFooter extends StatelessWidget {
  const _PaymentFooter({required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text('Pay ₹240.00 Now', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
      ),
    );
  }
}
