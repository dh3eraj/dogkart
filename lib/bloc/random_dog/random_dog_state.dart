part of "random_dog_cubit.dart";

@freezed
abstract class RandomDogState with _$RandomDogState {
  const factory RandomDogState.initial() = _Initial;

  const factory RandomDogState.loading() = _Loading;
  const factory RandomDogState.loaded(RandomDog randomDog) = _Loaded;
  const factory RandomDogState.error(String error) = _Error;
}
