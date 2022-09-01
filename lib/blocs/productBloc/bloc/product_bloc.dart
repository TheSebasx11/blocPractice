import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:practice/blocs/bloc/names_bloc.dart';
import 'package:practice/models/product.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<LoadProductEvent>(LoadProduct);
    //on<AddProduct>();
    //on<RemoveProduct>();
  }

  void LoadProduct(LoadProductEvent event, Emitter emit) async {
    var response = await http
        .get(Uri.parse("http://192.168.1.2:3000/api/products"), headers: {
      "Content-Type": "application/json",
    });
    List<Product> productos =
        List.from(jsonDecode(response.body).map((e) => Product.fromJson(e)));
    emit(ProductsLoaded(products: productos));
  }
}
