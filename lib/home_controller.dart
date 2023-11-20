import 'dart:convert';

import 'package:api_integration/home_service.dart';
import 'package:api_integration/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  late HomeService homeService;
  List<UserModel> dataList = [];
  bool isLoading = true;

  @override
  void onInit() {
    homeService = HomeService();
    getUserData();
    super.onInit();
  }

  void getUserData() async {
    try {
      isLoading = true;
      http.Response response = await homeService.getData();
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        for (int i = 0; i < data.length; i++) {
          dataList.add(UserModel.fromJson(data[i]));
        }
        isLoading = false;
      }
      update();
    } catch (exception) {
      update();
      print(exception);
    }
  }
}
