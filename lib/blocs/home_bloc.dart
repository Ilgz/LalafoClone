import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:lalafo/models/product_model.dart';

abstract class HomeBlocEvent {}

class HomeBlocLoadProductsEvent extends HomeBlocEvent {}
class HomeBlocSearchProductsEvent extends HomeBlocEvent {
  String query;
  HomeBlocSearchProductsEvent(this.query);
}

class HomeBlocInitialState extends HomeBlocState {}
class HomeBlocSearchProductsSuccess extends HomeBlocState {
  final List<Product> productList;
  HomeBlocSearchProductsSuccess(this.productList);
}
class HomeBlocLoadProductsSuccess extends HomeBlocState {
  final List<Product> productList;
  HomeBlocLoadProductsSuccess(this.productList);
}
class HomeBlocProductsLoading extends HomeBlocState {
}
abstract class HomeBlocState {}

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBloc() : super(HomeBlocInitialState()) {
    on<HomeBlocLoadProductsEvent>(_onLoadProducts);
    on<HomeBlocSearchProductsEvent>(_onSearchProducts);
  }
  _onSearchProducts(
      HomeBlocSearchProductsEvent event, Emitter<HomeBlocState> emit) async {
    emit(HomeBlocProductsLoading());
    final response = await http
        .get(Uri.parse("http://192.168.0.103:8000/lalafo/api/v1/product-info/?search=${event.query}"));
    emit(HomeBlocSearchProductsSuccess(productFromJson(utf8.decode(response.bodyBytes))));
  }
  _onLoadProducts(
      HomeBlocLoadProductsEvent event, Emitter<HomeBlocState> emit) async {
    emit(HomeBlocProductsLoading());
    final response = await http
        .get(Uri.parse("http://192.168.0.103:8000/lalafo/api/v1/product-info/"));
    emit(HomeBlocLoadProductsSuccess(productFromJson(utf8.decode(response.bodyBytes))));
  }
}
