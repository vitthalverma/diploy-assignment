import 'package:diploy_assignment/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:diploy_assignment/features/cart/presentation/widgets/payment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartUpdated && state.products.isNotEmpty) {
            // Calculate the grand total
            double grandTotal = state.products.entries.fold(0, (total, entry) {
              final product = entry.key;
              final quantity = entry.value;
              return total + (product.price * quantity);
            });
            return PaymentWidget(grandTotal: grandTotal);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartUpdated && state.products.isNotEmpty) {
            final products = state.products;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products.keys.elementAt(index);
                final quantity = products[product] ?? 1;

                return Slidable(
                  key: ValueKey(product.id),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          context
                              .read<CartBloc>()
                              .add(DeleteFromCartEvent(product: product));
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading:
                        Image.asset(product.imageUrl, width: 50, height: 50),
                    title: Text(product.name),
                    subtitle: Text('\$${product.price * quantity}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            context
                                .read<CartBloc>()
                                .add(DecreaseQuantityEvent(product));
                          },
                        ),
                        Text('$quantity', style: TextStyle(fontSize: 15.sp)),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            context
                                .read<CartBloc>()
                                .add(IncreaseQuantityEvent(product));
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('Your cart is empty.'));
          }
        },
      ),
    );
  }
}
