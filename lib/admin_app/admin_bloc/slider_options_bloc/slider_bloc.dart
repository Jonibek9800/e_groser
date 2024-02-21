import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:eGrocer/admin_app/admin_api/slider_api.dart';
import 'package:eGrocer/admin_app/admin_bloc/slider_options_bloc/slider_bloc_event.dart';
import 'package:eGrocer/admin_app/admin_bloc/slider_options_bloc/slider_bloc_model.dart';
import 'package:eGrocer/admin_app/admin_bloc/slider_options_bloc/slider_bloc_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../entity/slider.dart';

class SliderBloc extends Bloc<SliderBlocEvent, SliderBlocState> {
  SliderBloc()
      : super(InitSliderBlocState(sliderBlocModel: SliderBlocModel())) {
    on<GetSliderBlocEvent>((event, emit) => onGetSliderEvent(event, emit));
    on<PicDateTimeEvent>((event, emit) => onPicDateShow(event, emit));
    on<SelectedImageEvent>((event, emit) => onGetImageEvent(event, emit));
    on<AddSliderPosterEvent>((event, emit) => onAddSliderPoster(event, emit));
    on<UpdateSliderPosterEvent>(
        (event, emit) => onUpdateSliderPoster(event, emit));
    on<RemoveSliderPosterEvent>(
        (event, emit) => onRemoveSliderPoster(event, emit));
    on<MoveUpdatePosterEvent>((event, emit) => onMoveUpdatePoster(event, emit));
  }

  void onGetSliderEvent(GetSliderBlocEvent event, Emitter emit) async {
    final currentState = state.sliderBlocModel;
    try {
      currentState.posterList = [];
      final data = await SliderApi.getSliderPoster();
      if (data.containsKey("error")) {
        currentState.errorMessage = data['error'];
        emit(GetSliderBlocState(sliderBlocModel: currentState));
      }

      currentState.posterList = (data['carousel_poster'] as List)
          .map((e) => Poster.fromJson(e))
          .toList();
    } catch (err) {
      currentState.errorMessage = err as String;
    }
    emit(GetSliderBlocState(sliderBlocModel: currentState));
  }

  void onPicDateShow(PicDateTimeEvent event, Emitter emit) {
    final current = state.sliderBlocModel;
    event.startDate != null
        ? current.dateStart = event.startDate.toString()
        : current.dateEnd = event.endDate.toString();

    emit(PicDateTimeState(sliderBlocModel: current));
  }

  void onAddSliderPoster(AddSliderPosterEvent event, Emitter emit) async {
    final currentState = state.sliderBlocModel;
    try {
      final data = await SliderApi.addSliderPoster(
        poster: currentState.file,
        startDate: currentState.dateStart,
        expirationDate: currentState.dateEnd,
      );
      if (data.containsKey("poster")) {
        currentState.file = null;
        currentState.dateEnd = null;
        currentState.dateStart = null;
        currentState.posterList.add(Poster.fromJson(data['poster']));
      } else {
        print("Error data poster in not find");
      }
    } catch (err) {
      print(err);
    }
    emit(AddSliderPosterState(sliderBlocModel: currentState));
  }

  void onUpdateSliderPoster(UpdateSliderPosterEvent event, Emitter emit) async {
    final currentState = state.sliderBlocModel;

    final index = currentState.posterList
        .indexWhere((element) => element.id == currentState.poster?.id);

    final data = await SliderApi.updateSliderPoster(
      id: currentState.poster?.id,
      poster: currentState.file,
      startDate: currentState.dateStart,
      expirationDate: currentState.dateEnd,
    );
    currentState.posterList[index] = Poster.fromJson(data['poster']);
    emit(UpdateSliderPosterState(sliderBlocModel: currentState));
  }

  void onRemoveSliderPoster(RemoveSliderPosterEvent event, Emitter emit) async {
    final currentState = state.sliderBlocModel;
    final data = await SliderApi.deleteSliderPoster(id: event.id);
    if (data['success'] == true) {
      currentState.posterList = currentState.posterList
          .where((element) => element.id != event.id)
          .toList();
    }
    emit(RemoveSliderPosterState(sliderBlocModel: currentState));
  }

  void onMoveUpdatePoster(MoveUpdatePosterEvent event, Emitter emit) {
    final current = state.sliderBlocModel;
    current.poster = event.poster;
    current.dateStart = event.poster?.startDate;
    current.dateEnd = event.poster?.expirationDate;
    emit(MoveUpdatePosterState(sliderBlocModel: current));
  }

  void onGetImageEvent(SelectedImageEvent event, Emitter emit) async {
    final currentState = state.sliderBlocModel;
    var img = await currentState.image.pickImage(source: ImageSource.gallery);
    if (img != null) currentState.file = File(img.path);
    emit(SelectImageState(sliderBlocModel: currentState));
  }
}
