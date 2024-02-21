import 'package:flutter/cupertino.dart';

import '../../../di/di_container.dart';
import 'network_client.dart';

class FavoriteApi {
  static final _networkClient = locator<NetworkClient>();
  static Future<Map<String, dynamic>> setFavoriteProduct({
    required userId,
    required productId,
    required bool deleting,
  }) async {
    Map<String, dynamic> result = {};
    try {
      Map<String, dynamic> params = {
        "user_id": userId,
        "product_id": productId,
        'deleting': deleting,
      };
      final response =
          await _networkClient.dio.post("/toggle/favorite", data: params);
      debugPrint("error: ${response.data}");
      result = response.data;
    } catch (err) {
      debugPrint("error: $err");
      result = {"error": err};
    }
    return result;
  }

  static Future<Map<String, dynamic>> getFavoriteProducts(
      {required userId}) async {
    Map<String, dynamic> result = {};
    try {
      final response = await _networkClient.dio.get(
        "/get/favorite",
        queryParameters: {"user_id": userId},
      );
      result = response.data;
    } catch (err) {
      result = {"error": err};
    }
    return result;
  }
}
