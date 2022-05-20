import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wholesale/models/menu.dart';

import '../../../utils/app_text_styles.dart';
import '../../../widgets/ripple.dart';

class FoodItemView extends StatelessWidget {
  final Menu menu;
  final Widget? child;
  final Function()? onTap;
  final EdgeInsets? padding;
  const FoodItemView({
    required this.menu,
    this.child,
    this.onTap,
    this.padding = EdgeInsets.zero,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ripple(
      onTap: onTap ?? onTap,
      child: Container(
        color: Colors.white,
        padding: padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: menu.imageUrl,
                fit: BoxFit.cover,
                height: 80,
                width: 80,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      menu.title,
                      style: AppTextStyles.regular(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      menu.shortTitle,
                      maxLines: 1,
                      style: AppTextStyles.regular(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    if (child != null) child!,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
