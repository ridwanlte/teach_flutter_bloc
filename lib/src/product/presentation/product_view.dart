import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/src/product/bloc/bloc.dart';
import 'package:flutter_bloc_test/src/product/presentation/detail_product_view.dart';

import '../bloc/product_bloc.dart';
import '../components/components.dart';
import '../components/product_card.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  void initState() {
    super.initState();
    setState(() {
      context.read<ProductBloc>().add(GetProductEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.black87),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductLoadedState) {
            return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                itemCount: state.products.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final product = state.products[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailProductView(id: product.id)));
                      });
                      // showModalBottomSheet(
                      //   isScrollControlled: true,
                      //   context: context,
                      //   builder: (context) {
                      //     return Padding(
                      //       padding: MediaQuery.of(context).viewInsets,
                      //       child: ProductPreview(product: product),
                      //     );
                      //   },
                      // );
                    },
                    child: ProductCard(
                      product: product,
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                });
          }
          if (state is ProductEmptyState) {
            return Center(
              child: Text(
                "${state.emptyMessage}",
                style: TextStyle(color: Colors.green),
              ),
            );
          }
          if (state is ProductLoadingFailedState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.network_check_rounded,
                    color: Colors.blueAccent,
                    size: 40.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.redAccent),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
