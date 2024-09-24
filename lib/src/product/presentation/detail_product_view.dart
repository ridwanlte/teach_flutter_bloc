import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_test/src/product/bloc/bloc.dart';
class DetailProductView extends StatefulWidget {
  const DetailProductView({super.key, this.id});
  final int? id;

  @override
  State<DetailProductView> createState() => _DetailProductViewState();
}

class _DetailProductViewState extends State<DetailProductView> {
  @override
  void initState(){
    super.initState();
    setState(() {
      context.read<ProductBloc>().add(GetDetailProductEvent(id: widget.id!));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Product'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is DetailProductLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is DetailProductLoadedState) {
            final product = state.product;
            return Text('hello world: ${product.title}');
          }
          if (state is DetailProductEmptyState) {
            return Center(
              child: Text(
                "${state.emptyMessage}",
                style: TextStyle(color: Colors.green),
              ),
            );
          }
          if (state is DetailProductLoadingFailedState) {
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
        return SizedBox();
        },
      ),
    );
  }
}
