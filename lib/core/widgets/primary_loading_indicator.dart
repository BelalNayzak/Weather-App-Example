import 'package:flutter/cupertino.dart';

import '../style/AppColors.dart';

class PrimaryLoadingIndicator extends StatelessWidget {
  const PrimaryLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(color: AppColors.mainColor),
    );
  }
}
