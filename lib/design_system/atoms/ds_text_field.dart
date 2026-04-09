import 'package:finance_pro/core/extensions/build_context_x.dart';
import 'package:finance_pro/design_system/atoms/ds_text.dart';
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
    final tokens = context.tokens;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DsText(widget.label, tone: DsTextTone.label),
        SizedBox(height: tokens.spacing.sm),
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            helperText: widget.helperText,
            hintText: widget.hint ?? context.l10n.appNumericHint,
            suffixText: widget.suffix,
          ),
          keyboardType: TextInputType.numberWithOptions(
            decimal: widget.acceptsDecimal,
          ),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
