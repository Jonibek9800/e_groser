import 'package:eGrocer/di/di_container.dart';
import 'package:eGrocer/user_app/domain/api_client/network_client.dart';
import 'package:flutter/material.dart';

abstract class AppFactory {
  Widget makeApp();
}

final multiProviderApp = locator<MultiProviders>();
final networkClient = locator<NetworkClient>();
void main() async {
  registerLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await networkClient.initDio();
  runApp(multiProviderApp.providers());
}
