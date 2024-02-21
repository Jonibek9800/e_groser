import 'package:eGrocer/entity/check.dart';

class OrdersBlocEvent {}

class GetOrdersBlocEvent extends OrdersBlocEvent {}

class UpdateOrderBlocEvent extends OrdersBlocEvent {
  Check? check;

  UpdateOrderBlocEvent({required this.check});
}
