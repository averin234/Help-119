import 'package:flutter/material.dart';
import 'package:kreki119/app/core/values/app_colors.dart';
import 'package:kreki119/app/core/values/app_values.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.neutral100, // Background color
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary50), // Menyesuaikan warna dengan tema aplikasi
          strokeWidth: 6.0, // Ukuran tepi indikator loading
        ),
      ),
    );
  }
}
