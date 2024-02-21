import 'package:eGrocer/admin_app/admin_bloc/order_bloc/order_bloc.dart';
import 'package:eGrocer/admin_app/admin_bloc/order_bloc/order_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersListWidget extends StatelessWidget {
  const OrdersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order List"),
        centerTitle: true,
      ),
      body: BlocBuilder<OrderBloc, OrderBlocState>(
        builder: (BuildContext context, state) {
          final orderModel = state.orderBlocModel;
          return ListView.builder(
              itemCount: orderModel.checkList.length,
              itemBuilder: (BuildContext context, int index) {
                final order = orderModel.checkList[index];
                return Column(
                  children: [Text("${order.details}")],
                );
              });
        },
      ),
    );
  }
}
