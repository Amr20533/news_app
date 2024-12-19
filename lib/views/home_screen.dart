import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/components/main/custom_nav_bar.dart';
import 'package:news_app/core/controllers/home_controller.dart';
import 'package:news_app/utils/static/app_colors.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize:const Size.fromHeight(50.0),
        child:AppBar(
          backgroundColor: AppColors.white,
          title: const Row(mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Text("News",style:TextStyle(color:Colors.black),),
              Text("App",style:TextStyle(color:Colors.deepOrange),),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.currentScreen.value]),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}

