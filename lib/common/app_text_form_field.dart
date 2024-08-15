import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:velocity_x/velocity_x.dart";

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    required this.controller,
    required this.keyboardType,
    required this.textCapitalization,
    required this.textInputAction,
    required this.validator,
    required this.labelText,
    required this.hintText,
    this.readOnly = false,
    this.obscureText = false,
    this.maxLines,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.inputFormatters,
    this.enabled = false,
    this.autofillHints,
    this.prefixIcon,
    this.suffixIcon,
    this.labelColor = Colors.black,
    this.requiredField = false,
    this.hintColor,
    this.hintTextColor,
    this.enabledColor,
    this.inputTextColor,
    super.key,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final bool readOnly;
  final bool obscureText;
  final int? maxLines;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final Iterable<String>? autofillHints;
  final String labelText;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? labelColor;
  final Color? hintColor;
  final Color? hintTextColor;
  final Color? enabledColor;
  final Color? inputTextColor;
  final bool requiredField;

  @override
  Widget build(BuildContext context) {
    final Color primary = Theme.of(context).buttonTheme.colorScheme!.primary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: labelText,
                style: TextStyle(
                  color: labelColor,
                ),
              ),
            ).pOnly(left: 8),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction,
          readOnly: readOnly,
          obscureText: obscureText,
          maxLines: maxLines,
          maxLength: maxLength,
          onChanged: onChanged,
          onTap: onTap,
          validator: validator,
          inputFormatters: inputFormatters,
          enabled: enabled,
          cursorColor: primary,
          autofillHints: autofillHints,
          style: TextStyle(color: inputTextColor), // Set input text color
          decoration: InputDecoration(
            hintText: hintText,
            fillColor: hintColor,
            filled: hintColor != null,
            hintStyle: TextStyle(color: hintTextColor),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: enabledColor ?? primary),
              borderRadius: BorderRadius.circular(12.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: primary),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    ).pSymmetric(h: 12, v: 4);
  }
}
