import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.onTap,
    this.isIcon,
    this.side,
    required this.borderRadius,
    required this.child

  });

  final double width;
  final double height;
  final bool? isIcon;
  final Color color;
  final VoidCallback onTap;
  final BorderRadiusGeometry borderRadius;
  final Widget? child;
  final BorderSide? side;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: side ?? BorderSide.none,
          ),
          backgroundColor: color,
          elevation: 0,
          fixedSize: Size(width, height),
        ),
        onPressed: onTap,
        child: child
    );
  }
}
