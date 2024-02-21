import 'package:eGrocer/user_app/domain/api_client/network_client.dart';

import '../../di/di_container.dart';

class OrdersApi {
  static final _networkClient = locator<NetworkClient>();
  static Future<Map<String, dynamic>> getAllOrders() async {
    Map<String, dynamic> result = {};
    try {
      final response = await _networkClient.dio.get("/get/checks");
      if (response.statusCode != 200) {
        result = {"error": "Can not reading properties try again later"};
      }
      result = response.data;
    } catch (error) {
      result = {"error": error};
    }
    return result;
  }

  static Future<Map<String, dynamic>> updateOrder(
      {required int id, String? status}) async {
    Map<String, dynamic> result = {};
    try {
      final response = await _networkClient.dio
          .post("/update/check/$id", queryParameters: {"order_status": status});
      if (response.statusCode != 200) {
        result = {"error": "failed update status try later"};
      }
      result = response.data;
    } catch (err) {
      result = {"error": err};
    }
    return result;
  }
}
