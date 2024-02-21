import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../../entity/slider.dart';

class SliderBlocModel {
  List<Poster> posterList = [];
  Poster? poster;

  String? errorMessage;
  String? dateStart;
  String? dateEnd;
  File? file;
  ImagePicker image = ImagePicker();
}