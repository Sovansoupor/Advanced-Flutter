
import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class RidePrefTile extends StatelessWidget {
  final String title;
  final IconData iconLeft;
  final VoidCallback onTap;

//// for when location is selected, it enables swapping option
  final IconData? iconRight;
  final VoidCallback? onRightTap;

  final bool isInput;

  const RidePrefTile({
    Key? key,
    required this.title,
    required this.iconLeft,
    required this.onTap,
    this.iconRight,
    this.onRightTap,
    this.isInput = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = isInput ? BlaColors.textNormal : BlaColors.textLight;

    return ListTile(
      onTap: onTap,
      title: Text(title, style: BlaTextStyles.label.copyWith(color: textColor)),
      leading: Icon(iconLeft, color: BlaColors.iconLight),
      trailing: iconRight != null
          ? IconButton(
              icon: Icon(iconRight, color: BlaColors.iconLight),
              onPressed: onRightTap,
            )
          : null,
    );
  }
}
