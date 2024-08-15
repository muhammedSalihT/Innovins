import "dart:convert";

import "package:flutterinterviewproject/models/model.dart";
import "package:flutterinterviewproject/routes/Route.dart";
import "package:get/get.dart";
import "package:get_storage/get_storage.dart";

class StorageServices {
  static final StorageServices _singleton = StorageServices._internal();

  factory StorageServices() {
    return _singleton;
  }

  StorageServices._internal();

  String userParam = "userParam";
  GetStorage box = GetStorage();

  init() async {
    await GetStorage.init();
  }

  setData(Map<String, dynamic> value) async {
    await box.write(userParam, jsonEncode(value));
  }

  getData() {
    Map<String, dynamic> m = {};
    String data = box.read(userParam) ?? "";
    if (data.isNotEmpty) {
      m = jsonDecode(data);
    }
    return m;
  }

  AuthModule getUserData() {
    AuthModule module = AuthModule();
    Map<String, dynamic> m = Map.from(getData());
    print("Data :: $m");
    if (m.isNotEmpty) {
      module = AuthModule.fromJson(m);
    }
    return module;
  }

  Future<void> clearDataAndCloseApp() async {
    await box.remove(userParam);
    await Get.offAllNamed(RouteName.initial);
  }
}
