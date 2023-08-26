import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/model_postt.dart';

class HomeController extends GetxController {
  var postList = <posted>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchposttt();
  }

  Future<void> fetchposttt() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    final responsed = jsonDecode(response.body);

    if (response.statusCode == 200) {
      postList
          .addAll(List.from(responsed).map((e) => posted.fromJson(e)).toList());
      isLoading.value = false;
      update();
    } else {
      Get.snackbar('Error Loading data!',
          'Server responsed:${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
