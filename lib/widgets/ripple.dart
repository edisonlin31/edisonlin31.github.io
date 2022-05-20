import 'package:flutter/material.dart';

class Ripple extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final bool disabledSplash;
  final BorderRadius? borderRadius;

  const Ripple({
    Key? key,
    required this.child,
    this.onTap,
    this.borderRadius,
    this.disabledSplash = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: borderRadius,
        child: child,
        onTap: onTap,
        splashColor: disabledSplash ? Colors.transparent : null,
        highlightColor: disabledSplash ? Colors.transparent : null,
      ),
    );
  }
}
