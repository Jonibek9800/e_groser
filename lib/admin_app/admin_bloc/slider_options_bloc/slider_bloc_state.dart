import 'package:eGrocer/admin_app/admin_bloc/slider_options_bloc/slider_bloc_model.dart';

class SliderBlocState {
  SliderBlocModel sliderBlocModel;

  SliderBlocState({required this.sliderBlocModel});
}

class InitSliderBlocState extends SliderBlocState {
  InitSliderBlocState({required SliderBlocModel sliderBlocModel})
      : super(sliderBlocModel: sliderBlocModel);
}

class GetSliderBlocState extends SliderBlocState {
  GetSliderBlocState({required SliderBlocModel sliderBlocModel})
      : super(sliderBlocModel: sliderBlocModel);
}

class PicDateTimeState extends SliderBlocState {
  PicDateTimeState({required SliderBlocModel sliderBlocModel})
      : super(sliderBlocModel: sliderBlocModel);
}

class SelectImageState extends SliderBlocState {
  SelectImageState({required SliderBlocModel sliderBlocModel})
      : super(sliderBlocModel: sliderBlocModel);
}

class AddSliderPosterState extends SliderBlocState {
  AddSliderPosterState({required SliderBlocModel sliderBlocModel})
      : super(sliderBlocModel: sliderBlocModel);
}

class MoveUpdatePosterState extends SliderBlocState {
  MoveUpdatePosterState({required SliderBlocModel sliderBlocModel})
      : super(sliderBlocModel: sliderBlocModel);
}


class UpdateSliderPosterState extends SliderBlocState  {
  UpdateSliderPosterState({required SliderBlocModel sliderBlocModel})
      : super(sliderBlocModel: sliderBlocModel);
}

class RemoveSliderPosterState extends SliderBlocState {
  RemoveSliderPosterState({required SliderBlocModel sliderBlocModel})
      : super(sliderBlocModel: sliderBlocModel);
}