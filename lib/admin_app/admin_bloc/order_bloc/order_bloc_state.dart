import 'package:eGrocer/admin_app/admin_bloc/order_bloc/order_bloc_model.dart';

class OrderBlocState {
  OrderBlocModel orderBlocModel;

  OrderBlocState({required this.orderBlocModel});
}

class InitOrderBlocState extends OrderBlocState {
  InitOrderBlocState({required OrderBlocModel orderBlocModel})
      : super(orderBlocModel: orderBlocModel);
}

class GetOrderBlocState extends OrderBlocState {
  GetOrderBlocState({required OrderBlocModel orderBlocModel})
      : super(orderBlocModel: orderBlocModel);
}

class UpdateOrderBlocState extends OrderBlocState {
  UpdateOrderBlocState({required OrderBlocModel orderBlocModel})
      : super(orderBlocModel: orderBlocModel);
}
