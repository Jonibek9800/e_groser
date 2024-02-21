
import '../../../configuration/configuration.dart';
import '../../../di/di_container.dart';
import 'network_client.dart';

class CarouselApi {
  static final _networkClient = locator<NetworkClient>();
  static Future<Map<String, dynamic>> getCarouselImages() async {
    try {
      final response = await _networkClient.dio.get("/get/sliders");
      if (response.statusCode != 200) {
        return {"error": "I can not get the result"};
      }

      return response.data;
    } catch (err) {
      return {"error": err};
    }
  }

  static String getCarouselPoster({required image}) {
    return "${Configuration.host}/get/carousel/posters/$image";
  }
}
