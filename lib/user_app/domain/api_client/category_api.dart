import '../../../configuration/configuration.dart';
import '../../../di/di_container.dart';
import '../../../entity/category.dart';
import 'network_client.dart';

class CategoryApiClient {
  final _networkClient = locator<NetworkClient>();

  Future<List<Category>> getLimitCategories() async {
    const limit = 6;
    parser(dynamic json) {
      final jsonMap = json.data;
      List<dynamic> list = jsonMap['categories'];
      List<Category> response = list.map((e) => Category.fromJson(e)).toList();
      return response;
    }

    final result = await _networkClient.dio.get(
      "/get/categories",
      queryParameters: {"limit": limit},
    );
    return parser(result);
  }

  String getCategoryImage(String? posterPath) {
    return "${Configuration.host}/get/category/image/$posterPath";
  }

  Future<List<Category>> getAllCategories() async {
    parser(dynamic json) {
      final jsonMap = json.data;
      List<dynamic> list = jsonMap['categories'];
      List<Category> response = list.map((e) => Category.fromJson(e)).toList();
      return response;
    }

    final result = await _networkClient.dio.get(
      "/get/categories",
    );
    return parser(result);
  }
}
