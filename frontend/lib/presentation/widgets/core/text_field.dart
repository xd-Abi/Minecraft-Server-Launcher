import 'package:flutter/material.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../../application/prelude.dart';
import '../prelude.dart';

class AppTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String? value;
  final IconData? icon;
  final Widget? suffix;
  final String errorText;

  final String hint;
  final TextInputType keyboardType;

  const AppTextField({
    Key? key,
    this.onChanged,
    this.value,
    this.icon,
    this.suffix,
    this.errorText = '',
    this.hint = 'Field',
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(builder: (theme) {
      final Color primaryColor =
          errorText.isNotEmpty ? theme.error : theme.primary;

      final OutlineInputBorder border = OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: errorText.isNotEmpty ? theme.error : theme.bg2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      );

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            autocorrect: false,
            initialValue: value,
            onChanged: onChanged,
            keyboardType: keyboardType,
            style: TextStyles.regular.textColor(theme.text1),
            cursorColor: primaryColor,
            decoration: InputDecoration(
              filled: true,
              fillColor: theme.bg3,
              hintText: hint,
              hintStyle: TextStyles.regular.textColor(theme.text3),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
              prefixIcon: Icon(
                icon,
                size: 22,
                color: primaryColor,
              ),
              hoverColor: Colors.transparent,
              enabledBorder: border,
              border: border,
              focusedBorder: border,
              errorBorder: border,
              focusedErrorBorder: border,
              errorText: '',
              errorStyle: const TextStyle(fontSize: 0),
            ),
          ),
          if (errorText.isNotEmpty) _ErrorText(text: errorText, theme: theme)
        ],
      );
    });
  }
}

class _ErrorText extends StatelessWidget {
  final String text;
  final AppTheme theme;

  const _ErrorText({
    Key? key,
    required this.text,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppText.regular(text, color: theme.error);
  }
}
