import 'dart:developer';

import 'package:dogkart/database/images_db.dart';
import 'package:dogkart/model/dog_mage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'history_state.dart';
part 'history_cubit.freezed.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(const HistoryState.initial());
  final ImagesDb _imagesDb = ImagesDb();

  Future<void> getDogList() async {
    List<DogImage> images = [];

    try {
      emit(const HistoryState.loading());
      images = await _imagesDb.getImages();
      log("message :" + images.toString());
      emit(HistoryState.loaded(images));
    } on Exception catch (_, e) {
      emit(HistoryState.error(e.toString()));
      log(e.toString());
    }
  }
}
