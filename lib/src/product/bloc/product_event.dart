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

class PutProductEvent extends ProductEvent {
  final int? id;
  final String? title;

  PutProductEvent({required this.id, required this.title});
}
