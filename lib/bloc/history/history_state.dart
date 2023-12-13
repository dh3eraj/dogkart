part of "history_cubit.dart";

@freezed
abstract class HistoryState with _$HistoryState {
  const factory HistoryState.initial() = _Initial;

  const factory HistoryState.loading() = _Loading;
  const factory HistoryState.loaded(List<DogImage> dogs) = _Loaded;
  const factory HistoryState.error(String error) = _Error;
}
