import 'package:eGrocer/entity/slider.dart';
import 'package:flutter/cupertino.dart';

class SliderBlocEvent {}

class GetSliderBlocEvent extends SliderBlocEvent {}

class PicDateTimeEvent extends SliderBlocEvent {
  DateTime? startDate;
  DateTime? endDate;

  PicDateTimeEvent({required this.startDate, required this.endDate});
}

class SelectedImageEvent extends SliderBlocEvent {}

class AddSliderPosterEvent extends SliderBlocEvent {}

class MoveUpdatePosterEvent extends SliderBlocEvent {
  Poster? poster;

  MoveUpdatePosterEvent({required this.poster});
}

class UpdateSliderPosterEvent extends SliderBlocEvent {}

class RemoveSliderPosterEvent extends SliderBlocEvent {
  int? id;
  RemoveSliderPosterEvent({required this.id});
}
