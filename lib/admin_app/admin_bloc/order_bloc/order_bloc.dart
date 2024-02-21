import 'package:bloc/bloc.dart';
import 'package:eGrocer/admin_app/admin_api/orders_api.dart';
import 'package:eGrocer/admin_app/admin_bloc/order_bloc/order_bloc_event.dart';
import 'package:eGrocer/admin_app/admin_bloc/order_bloc/order_bloc_model.dart';
import 'package:eGrocer/admin_app/admin_bloc/order_bloc/order_bloc_state.dart';
import 'package:eGrocer/entity/check.dart';
import 'package:flutter/cupertino.dart';

class OrderBloc extends Bloc<OrdersBlocEvent, OrderBlocState> {
  OrderBloc() : super(InitOrderBlocState(orderBlocModel: OrderBlocModel())) {
    on<GetOrdersBlocEvent>((event, emit) async {
      final currentState = state.orderBlocModel;
      final data = await OrdersApi.getAllOrders();
      if (data.containsKey(["error"])) {
        debugPrint("Error from get request");
      }
      currentState.checkList = (data['checks'] as List)
          .map((element) => Check.fromJson(element))
          .toList();
      debugPrint("checkList: ${currentState.checkList}");
      emit(GetOrderBlocState(orderBlocModel: currentState));
    });
  }
}
