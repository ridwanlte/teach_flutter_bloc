part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  const ProductLoadedState({required this.products});

  final List<Product> products;
  @override
  List<Object> get props => [products];
}

class ProductEmptyState extends ProductState {
  const ProductEmptyState({required this.emptyMessage});
  final String emptyMessage;
}

class ProductLoadingFailedState extends ProductState {
  const ProductLoadingFailedState({required this.errorMessage});
  final String errorMessage;
}


class DetailProductLoadingState extends ProductState {}

class DetailProductLoadedState extends ProductState {
  const DetailProductLoadedState({required this.product});

  final Product product;
  @override
  Map<Object, Object> get detailProp => {'product':product};
}

class DetailProductEmptyState extends ProductState {
  const DetailProductEmptyState({required this.emptyMessage});
  final String emptyMessage;
}

class DetailProductLoadingFailedState extends ProductState {
  const DetailProductLoadingFailedState({required this.errorMessage});
  final String errorMessage;
}
