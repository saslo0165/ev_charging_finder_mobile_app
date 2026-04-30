import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class AuthTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final bool obscureText;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.errorText,
    this.obscureText = false,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  final _focusNode = FocusNode();
  bool _isFocused = false;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _focusNode.addListener(() {
      setState(() => _isFocused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool hasError = widget.errorText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 64,
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: hasError
                  ? AppColors.error
                  : (_isFocused ? AppColors.primary : Colors.transparent),
              width: 1.5,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(
                widget.prefixIcon,
                color: _isFocused ? AppColors.primary : const Color(0xFF94A3B8),
                size: 24,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_isFocused || widget.controller.text.isNotEmpty)
                      Text(
                        widget.label,
                        style: TextStyle(
                          color: _isFocused ? AppColors.primary : const Color(0xFF94A3B8),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    TextField(
                      controller: widget.controller,
                      focusNode: _focusNode,
                      keyboardType: widget.keyboardType,
                      obscureText: _obscureText,
                      cursorColor: AppColors.primary,
                      onChanged: widget.onChanged,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        hintText: widget.controller.text.isEmpty ? widget.hintText : '',
                        hintStyle: const TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.obscureText)
                GestureDetector(
                  onTap: () => setState(() => _obscureText = !_obscureText),
                  child: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    size: 20,
                    color: const Color(0xFF94A3B8),
                  ),
                )
              else if (widget.controller.text.isNotEmpty && _isFocused)
                GestureDetector(
                  onTap: () {
                    widget.controller.clear();
                    if (widget.onChanged != null) widget.onChanged!('');
                  },
                  child: const Icon(
                    Icons.close,
                    size: 18,
                    color: Colors.black,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
