import 'dart:ui';

import 'package:flutter/material.dart';

class BlurFilter extends StatelessWidget {
  const BlurFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: const SizedBox(),
      // child: Container(
      //   color: Colors.black.withOpacity(0),
      // ),
    );
  }
}
