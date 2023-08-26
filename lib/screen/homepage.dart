import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:jsonpostapigetx/controller/controllers.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            body: controller.isLoading.value
                ? CircularProgressIndicator()
                : Center(
                    child: ListView.builder(
                      itemCount: controller.postList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading:
                                Text('id:${controller.postList[index].id}'),
                            subtitle:
                                Text('body:${controller.postList[index].body}'),
                            title: Text(
                                'title:${controller.postList[index].title}'),
                            trailing: Text(
                                'userId:${controller.postList[index].userId}'),
                          ),
                        );
                      },
                    ),
                  ),
          );
        },
      ),
    );
  }
}
