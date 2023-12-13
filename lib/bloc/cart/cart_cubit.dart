import 'dart:developer';

import 'package:dogkart/database/cart_db.dart';
import 'package:dogkart/model/dog_mage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState.initial());
  final CartDb _imagesDb = CartDb();

  Future<void> getAllItems() async {
    List<DogImage> images = [];

    try {
      emit(const CartState.loading());
      images = await _imagesDb.getAllItems();
      emit(CartState.loaded(images));
    } on Exception catch (_, e) {
      emit(CartState.error(e.toString()));
      log(e.toString());
    }
  }

  Future<void> getTotalPrice() async {
    int total = 0;
    List<DogImage> images = [];

    try {
      emit(const CartState.calculating());
      images = await _imagesDb.getAllItems();
      for (DogImage item in images) {
        total = total + item.price;
      }
      emit(CartState.calculated(total));
    } on Exception catch (_, e) {
      emit(CartState.errorCalculating());
      log(e.toString());
    }
  }
}
