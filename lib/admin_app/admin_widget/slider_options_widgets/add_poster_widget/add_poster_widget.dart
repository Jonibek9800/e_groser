import 'dart:io';

import 'package:eGrocer/admin_app/admin_bloc/slider_options_bloc/slider_bloc.dart';
import 'package:eGrocer/admin_app/admin_bloc/slider_options_bloc/slider_bloc_event.dart';
import 'package:eGrocer/admin_app/admin_bloc/slider_options_bloc/slider_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/resources.dart';

class AddPosterWidget extends StatelessWidget {
  const AddPosterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Slider Poster"),
        centerTitle: true,
      ),
      body: BlocBuilder<SliderBloc, SliderBlocState>(
        builder: (BuildContext context, state) {
          final posterModel = state.sliderBlocModel;
          return Stack(
            children: [
              ListView(
                children: [
                  InkWell(
                    onTap: () {
                      context.read<SliderBloc>().add(SelectedImageEvent());
                    },
                    child: posterModel.file != null
                        ? Image.file(
                      posterModel.file as File,
                      height: 250,
                    )
                        : Image.asset(
                      AppImages.person,
                      height: 250,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [Text("After"), Text("Before")],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FloatingActionButton.small(
                                heroTag: "btn1",
                                onPressed: () {
                                  final pik = showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2030),
                                  );
                                  pik.then((value) => context.read<SliderBloc>().add(
                                      PicDateTimeEvent(startDate: value, endDate: null)));
                                },
                                child: const Icon(Icons.date_range),
                              ),
                              FloatingActionButton.small(
                                heroTag: "btn2",
                                onPressed: () {
                                  final date = showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return DatePickerDialog(
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2030),
                                      );
                                    },
                                  );
                                  date.then((value) => context.read<SliderBloc>().add(
                                      PicDateTimeEvent(startDate: null, endDate: value)));
                                },
                                child: const Icon(Icons.date_range),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  width: 100,
                                  child: Text(
                                    posterModel.dateStart != null
                                        ? "${posterModel.dateStart?.split(" ")[0]}"
                                        : "",
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  )),
                              SizedBox(
                                  width: 100,
                                  child: Text(
                                    posterModel.dateEnd != null
                                        ? "${posterModel.dateEnd?.split(" ")[0]}"
                                        : "",
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: () { 
                      context.read<SliderBloc>().add(AddSliderPosterEvent());
                      Navigator.of(context).pop();
                    }, child: Text("Add Poster"),),
                  ),
                ),
              )
            ] 
          );
        },
      ),
    );
  }
}
