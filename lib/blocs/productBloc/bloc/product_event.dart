part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProductEvent extends ProductEvent {}

class AddProduct extends ProductEvent {
  final Product producto;

  const AddProduct({required this.producto});

  @override
  List<Object> get props => [producto];
}

class RemoveProduct extends ProductEvent {
  final int id;
  const RemoveProduct({required this.id});

  @override
  List<Object> get props => [id];
}

class EditProduct extends ProductEvent {
  final Product producto;

  const EditProduct({required this.producto});

  @override
  List<Object> get props => [producto];
}
