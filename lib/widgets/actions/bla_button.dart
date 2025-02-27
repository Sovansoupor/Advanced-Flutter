import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

enum ButtonType {
  primary,
  secondary,
}

class BlaButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final ButtonType type;

  const BlaButton({
    Key? key,
    required this.text,
    this.type = ButtonType.primary,
    required this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Color backGroundColor =
        type == ButtonType.primary ? BlaColors.primary : BlaColors.white;

    Color textColor =
        type == ButtonType.primary ? BlaColors.white : BlaColors.primary;
        
    BorderSide border = type == ButtonType.primary
        ? BorderSide.none
        : BorderSide(color: BlaColors.primary, width: 1);

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: backGroundColor,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BlaSpacings.radius),
        ),
        side: border,
      ),
      onPressed: onPressed,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, color: textColor),
              SizedBox(width: 8),
            ],
            Text(
              text,
              style: BlaTextStyles.button.copyWith(color: textColor),
            ),
          ]),
    );
  }
}
