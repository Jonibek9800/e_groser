import 'package:eGrocer/di/di_container.dart';
import 'package:eGrocer/user_app/domain/api_client/network_client.dart';
import 'package:flutter/material.dart';

abstract class AppFactory {
  Widget makeApp();
}

final multiProviderApp = locator<MultiProviders>();

void main() async {
  registerLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await NetworkClient.initDio();
  runApp(multiProviderApp.providers());
}
