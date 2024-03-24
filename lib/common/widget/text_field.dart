import 'package:flutter/material.dart';

import '../../resources/dimens.dart';

class InputField extends StatelessWidget {
  final Widget label;
  final Icon? prefixIcon;
  final void Function()? onTap;
  final BorderRadius? borderRadius;

  const InputField({
    Key? key,
    this.onTap,
    this.prefixIcon,
    this.borderRadius,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      expands: true,
      maxLines: null,
      decoration: InputDecoration(
        filled: true,
        label: label,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: borderRadius ?? BorderRadius.circular(Dimens.k16),
        ),
        hintStyle: Theme.of(context).textTheme.bodySmall,
        fillColor: Theme.of(context).colorScheme.surface,
      ),
      onTap: onTap,
      keyboardType: TextInputType.text,
    );
  }
}
