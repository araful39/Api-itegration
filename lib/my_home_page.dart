import 'package:api_integration/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeController homeController=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("API"),
      ),
      body: GetBuilder<HomeController>(
        builder: (_){
          return homeController.isLoading?Center(child: CircularProgressIndicator(),):
          ListView.builder(
              itemCount: homeController.dataList.length,
              itemBuilder: (context,index){
                return ListTile(
                  trailing: Text(homeController.dataList[index].userId.toString()),
                  leading: Text(homeController.dataList[index].id.toString()),
                  title: Text(homeController.dataList[index].title.toString()),
                );
              }
          );
        },
      ),

    );
  }
}
