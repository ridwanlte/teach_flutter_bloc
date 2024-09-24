import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../helpers/exception_handler.dart';
import '../data/models/product_model/product.dart';
import '../data/repository/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    // on<ProductEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<ProductEvent>((ProductEvent event, Emitter<ProductState> emit) async {
      log("data event saat ini: ${event}");;
      if (event is GetProductEvent) {
        emit(ProductLoadingState());
        try {
          final products = await productRepository.getProducts();
          if (products.isEmpty) {
            emit(ProductEmptyState(emptyMessage: 'Data tidak ditemukan'));
          } else {
            emit(ProductLoadedState(products: products as List<Product>));
          }
        } catch (e) {
          final message = handleExceptionWithMessage(e);
          emit(ProductLoadingFailedState(errorMessage: message));
        }
      } else if (event is GetDetailProductEvent) {
        emit(DetailProductLoadingState());
        try {
          final product = await productRepository.getDetailProduct(event.id);
          if (product == null) {
            emit(DetailProductEmptyState(emptyMessage: 'Data tidak ditemukan'));
          } else {
            emit(DetailProductLoadedState(product: product));
          }
        } catch (e) {
          final message = handleExceptionWithMessage(e);
          emit(DetailProductLoadingFailedState(errorMessage: message));
        }
      }
    });
  }
}
