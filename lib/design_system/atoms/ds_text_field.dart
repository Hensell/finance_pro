import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:flutter/material.dart';

class DsTextField extends StatefulWidget {
  const DsTextField({
    this.acceptsDecimal = true,
    this.helperText,
    required this.label,
    required this.onChanged,
    this.hint,
    this.initialValue,
    this.suffix,
    super.key,
  });

  final bool acceptsDecimal;
  final String? helperText;
  final String? hint;
  final String? initialValue;
  final String label;
  final ValueChanged<String> onChanged;
  final String? suffix;

  @override
  State<DsTextField> createState() => _DsTextFieldState();
}

class _DsTextFieldState extends State<DsTextField> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.initialValue,
  );

  @override
  void didUpdateWidget(covariant DsTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue &&
        widget.initialValue != _controller.text) {
      _controller.text = widget.initialValue ?? '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        errorMaxLines: 2,
        helperText: widget.helperText,
        helperMaxLines: 2,
        hintText: widget.hint ?? context.l10n.appNumericHint,
        labelText: widget.label,
        suffixText: widget.suffix,
      ),
      keyboardType: TextInputType.numberWithOptions(
        decimal: widget.acceptsDecimal,
      ),
      textInputAction: TextInputAction.next,
      onChanged: widget.onChanged,
    );
  }
}
