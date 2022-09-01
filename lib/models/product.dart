import 'package:equatable/equatable.dart';

class Product extends Equatable {
  int id, cantidad;
  String nombre;
  int precio, peso;

  Product({
    required this.id,
    required this.cantidad,
    required this.nombre,
    required this.precio,
    required this.peso,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      cantidad: json["cantidad"],
      nombre: json["nombre"],
      precio: json["precio"],
      peso: json["peso"],
    );
  }

  @override
  List<Object?> get props => [id, cantidad, nombre, precio, peso];
}
