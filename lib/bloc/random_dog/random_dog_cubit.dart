import 'dart:developer';

import 'package:dogkart/database/cart_db.dart';
import 'package:dogkart/model/dog_mage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dogkart/model/random_dog.dart';
import 'package:dogkart/network/api_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'random_dog_state.dart';
part 'random_dog_cubit.freezed.dart';

class RandomDogCubit extends Cubit<RandomDogState> {
  RandomDogCubit() : super(const RandomDogState.initial());
  final ApiRepository _repository = ApiRepository.instance;
  final CartDb _cartDb = CartDb();

  Future<void> getRandomDog() async {
    RandomDog? randomDog;
    try {
      emit(const RandomDogState.loading());
      randomDog = await _repository.getRandomDog();

      emit(RandomDogState.loaded(randomDog!));
    } on Exception catch (_, e) {
      emit(RandomDogState.error(e.toString()));
      log(e.toString());
    }
  }

  Future<void> addToCart(DogImage dog) async {
    try {
      emit(const RandomDogState.addingToCart());
      await _cartDb.insertRow(dog.url, dog.price);

      emit(RandomDogState.addedToCart());
    } on Exception catch (_, e) {
      emit(RandomDogState.errorAddingToCart());
      log(e.toString());
    }
  }
}
