import 'package:flutter/material.dart';

import '../extensions/extensions.dart';
import '../themes/theme.dart';

class SnackbarWidget extends StatelessWidget {
  const SnackbarWidget({
    super.key,
    required this.title,
    required this.message,
    this.error = false,
  });

  final String title;
  final String message;
  final bool error;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            padding: 5.all,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(left: 10.circular),
            ),
            child: Icon(
              error ? Icons.close : Icons.check,
              color: AppColors.white,
              size: 20,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.text16PxMedium
                        .copyWith(color: AppColors.white),
                  ),
                  Text(
                    message,
                    style: AppStyles.text14Px.copyWith(color: AppColors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
