part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProductEvent extends ProductEvent {}

class GetDetailProductEvent extends ProductEvent {
  final int? id;

  GetDetailProductEvent({required this.id});
}
