// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import '../../../../core/theme/app_colors.dart';
// import '../../../../core/theme/app_typography.dart';
// import '../../../../core/widgets/gap.dart';
// import '../../../../core/widgets/hub_app_bar.dart';
// import 'providers/auth_state.dart';
// import 'providers/auth_notifier.dart';
//
// class OtpVerificationScreen extends ConsumerStatefulWidget {
//   final String email;
//   const OtpVerificationScreen({super.key, required this.email});
//
//   @override
//   ConsumerState<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
// }
//
// class _OtpVerificationScreenState extends ConsumerState<OtpVerificationScreen> {
//   final List<TextEditingController> _controllers = List.generate(5, (_) => TextEditingController());
//   final List<FocusNode> _focusNodes = List.generate(5, (_) => FocusNode());
//   int _secondsRemaining = 60;
//   Timer? _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     _startTimer();
//   }
//
//   void _startTimer() {
//     _timer?.cancel();
//     _secondsRemaining = 60;
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (_secondsRemaining > 0) {
//         setState(() => _secondsRemaining--);
//       } else {
//         _timer?.cancel();
//       }
//     });
//   }
//
//   bool get _isOtpComplete => _controllers.every((c) => c.text.isNotEmpty);
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     for (var controller in _controllers) {
//       controller.dispose();
//     }
//     for (var node in _focusNodes) {
//       node.dispose();
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final authState = ref.watch(authProvider);
//     final isLoading = authState.isLoading;
//
//     ref.listen(authProvider, (previous, next) {
//       next.whenData((state) {
//         if (state is AuthAuthenticated) {
//           context.go('/registration-success');
//         } else if (state is AuthError) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(state.message), backgroundColor: Colors.red),
//           );
//         }
//       });
//     });
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: const HubAppBar(title: '', showBackButton: true),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Column(
//               children: [
//                 Gap.h48,
//                 Text(
//                   'Verify your email',
//                   style: context.titleLarge.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
//                   textAlign: TextAlign.center,
//                 ),
//                 Gap.h12,
//                 Text(
//                   'Please enter the OTP sent to\n${widget.email}',
//                   style: context.bodyMedium.copyWith(color: AppColors.onSurfaceVariant),
//                   textAlign: TextAlign.center,
//                 ),
//                 Gap.h48,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: List.generate(
//                     5,
//                     (index) => _buildOtpBox(index),
//                   ),
//                 ),
//                 Gap.h32,
//                 TextButton(
//                   onPressed: _secondsRemaining == 0 ? _startTimer : null,
//                   child: Text(
//                     _secondsRemaining > 0
//                         ? 'Resend OTP in $_secondsRemaining s'
//                         : 'Resend OTP now',
//                     style: context.bodyMedium.copyWith(
//                       color: AppColors.onSurfaceVariant,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Gap.h48,
//                 Gap.h32, // More balanced spacing
//                 SizedBox(
//                   width: double.infinity,
//                   height: 56,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: _isOtpComplete && !isLoading ? AppColors.primary : const Color(0xFFF1F5F9),
//                       foregroundColor: _isOtpComplete && !isLoading ? Colors.white : AppColors.onSurfaceVariant,
//                       elevation: 0,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     onPressed: _isOtpComplete && !isLoading
//                         ? () {
//                             final otp = _controllers.map((c) => c.text).join();
//                             ref.read(authProvider.notifier).verifyOtp(
//                                   email: widget.email,
//                                   otp: otp,
//                                 );
//                           }
//                         : null,
//                     child: isLoading
//                         ? const SizedBox(
//                             height: 20,
//                             width: 20,
//                             child: CircularProgressIndicator(
//                               strokeWidth: 2,
//                               color: Colors.white,
//                             ),
//                           )
//                         : const Text('Verify'),
//                   ),
//                 ),
//                 Gap.h24,
//                 RichText(
//                   textAlign: TextAlign.center,
//                   text: TextSpan(
//                     style: context.bodySmall.copyWith(color: Colors.black, fontSize: 12),
//                     children: [
//                       const TextSpan(text: 'By continuing, I accept '),
//                       TextSpan(
//                         text: 'Terms of service',
//                         style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
//                       ),
//                       const TextSpan(text: ' & '),
//                       TextSpan(
//                         text: 'Privacy Policy',
//                         style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Gap.h24,
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildOtpBox(int index) {
//     return SizedBox(
//       width: 56,
//       height: 64,
//       child: TextField(
//         controller: _controllers[index],
//         focusNode: _focusNodes[index],
//         keyboardType: TextInputType.number,
//         textAlign: TextAlign.center,
//         onChanged: (value) {
//           if (value.isNotEmpty && index < 4) {
//             _focusNodes[index + 1].requestFocus();
//           } else if (value.isEmpty && index > 0) {
//             _focusNodes[index - 1].requestFocus();
//           }
//           setState(() {});
//         },
//         inputFormatters: [
//           LengthLimitingTextInputFormatter(1),
//           FilteringTextInputFormatter.digitsOnly,
//         ],
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: const Color(0xFFF8FAFC),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: const BorderSide(color: Colors.transparent),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
//           ),
//           contentPadding: EdgeInsets.zero,
//         ),
//         style: const TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//     );
//   }
// }
