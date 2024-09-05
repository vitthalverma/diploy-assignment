import 'package:diploy_assignment/core/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({super.key, required this.grandTotal});
  final double grandTotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 13.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(2.5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${grandTotal.toStringAsFixed(2)}', // Display grand total
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.sp,
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  'Grand Total',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Container(
              width: 60.w,
              decoration: BoxDecoration(
                color: AppColors.green400,
                borderRadius: BorderRadius.circular(2.w),
              ),
              child: Center(
                child: Text(
                  'Place Order',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
