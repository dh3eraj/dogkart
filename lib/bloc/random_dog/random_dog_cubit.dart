import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dogkart/model/random_dog.dart';
import 'package:dogkart/network/api_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'random_dog_state.dart';
part 'random_dog_cubit.freezed.dart';

class RandomDogCubit extends Cubit<RandomDogState> {
  RandomDogCubit() : super(const RandomDogState.initial());
  final ApiRepository _repository = ApiRepository.instance;

  Future<void> getFamilyMemberDetails() async {
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
}
