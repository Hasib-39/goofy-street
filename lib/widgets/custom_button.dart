import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool outlined;
  final Color color;
  final double height;
  final double radius;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.outlined = false,
    this.color = Colors.black,
    this.height = 56,
    this.radius = 25,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(radius);
    final baseTextStyle = textStyle ?? const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 1,
    );

    if (outlined) {
      return SizedBox(
        width: double.infinity,
        height: height,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: color, width: 2),
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
          ),
          child: Text(
            label,
            style: baseTextStyle.copyWith(color: color),
          ),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          elevation: 8,
          shadowColor: color.withOpacity(0.4),
        ),
        child: Text(label, style: baseTextStyle),
      ),
    );
  }
}
