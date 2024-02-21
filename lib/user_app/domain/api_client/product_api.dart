import 'package:flutter/cupertino.dart';

import '../../../configuration/configuration.dart';
import '../../../di/di_container.dart';
import '../../../entity/product.dart';
import 'network_client.dart';

class ProductApiClient {
  final _networkClient = locator<NetworkClient>();

  String getImage(String? posterPath) {
    return "${Configuration.host}/get/product/image/$posterPath";
  }

  Future<Map<String, dynamic>> getAllProducts(
      String? search, int? page, orderName, orderMethod) async {
    Map<String, dynamic> result = {};
    try {
      Map<String, dynamic> params = {
        "search": search,
        "page": page,
        "order_name": orderName,
        "method": orderMethod,
      };
      final response = await _networkClient.dio
          .get("/get/products", queryParameters: params);
      result = response.data['products'];
    } catch (err) {
      result = {"error": err};
    }
    return result;
  }

  Future<List<Product>> getLimitProducts(
      int? limit, orderName, orderMethod) async {
    List<Product> result = [];
    Map<String, dynamic> params = {
      "limit": limit,
      "order_name": orderName,
      "method": orderMethod,
    };
    final response =
        await _networkClient.dio.get("/get/products", queryParameters: params);
    debugPrint("response limit: ${response.data}");
    result = (response.data["products"]['data'] as List)
        .map((e) => Product.fromJson(e))
        .toList();
    return result;
  }

  Future<List<Product>> getProductByCategory(int? categoryId) async {
    List<Product> result = [];

    final response = await _networkClient.dio.get(
      "/get/products/$categoryId",
    );
    debugPrint("$response");
    result = (response.data["products"] as List)
        .map((e) => Product.fromJson(e))
        .toList();
    return result;
  }
}
