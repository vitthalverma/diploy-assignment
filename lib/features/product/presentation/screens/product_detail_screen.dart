import 'package:diploy_assignment/core/app/app_colors.dart';
import 'package:diploy_assignment/core/app/app_snackbar.dart';
import 'package:diploy_assignment/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:diploy_assignment/features/product/domain/entity/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.name,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartUpdated) {
            return AppSnack.success(context, 'Item added to cart');
          }
          if (state is CartError) {
            return AppSnack.error(context, 'Error adding to cart');
          }
        },
        child: Padding(
          padding:
              EdgeInsets.only(bottom: 5.h, left: 2.2.h, right: 2.2.h, top: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(2.h),
                child: Image.asset(
                  product.imageUrl,
                  height: 30.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  //    color: AppColors.green400,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                product.description,
                style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                ),
              ),
              Flexible(child: Container()),
              InkWell(
                onTap: () {
                  context
                      .read<CartBloc>()
                      .add(AddToCartEvent(product: product));
                },
                child: Container(
                  height: 6.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(1.5.h),
                      border: Border.all()),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add Item to Cart',
                          style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        const Icon((Icons.shopping_cart_outlined)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
