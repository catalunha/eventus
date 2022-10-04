import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class InitBack4app {
  InitBack4app() {
    // init();
  }

  Future<bool> init() async {
    const keyApplicationId = 'oDPzUoXUvWge3473V5MXP4XUvLlJOs9VMOr8wxXg';
    const keyClientKey = 'MRF5tMRUYexc5HV1iEKUkRxuS5LaiqkFOTeGyy6k';
    const keyParseServerUrl = 'https://parseapi.back4app.com';
    await Parse().initialize(
      keyApplicationId,
      keyParseServerUrl,
      clientKey: keyClientKey,
      autoSendSessionId: true,
      debug: true,
    );
    return (await Parse().healthCheck()).success;
  }
}
