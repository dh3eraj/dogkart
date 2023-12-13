part of "cart_cubit.dart";

@freezed
abstract class CartState with _$CartState {
  const factory CartState.initial() = _Initial;

  const factory CartState.loading() = _Loading;
  const factory CartState.loaded(List<DogImage> dogs) = _Loaded;
  const factory CartState.error(String error) = _Error;

  const factory CartState.calculating() = _Calculating;
  const factory CartState.calculated(int total) = _Calculated;
  const factory CartState.errorCalculating() = _ErrorCalculating;
}
