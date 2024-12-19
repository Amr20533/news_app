import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/controllers/home_controller.dart';
import 'package:news_app/utils/static/app_colors.dart';

class CustomBottomNavBar extends GetView<HomeController> {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius:const BorderRadius.all(Radius.circular(30.0)),
          color: Colors.white,
          boxShadow:[
            BoxShadow(
              color:Colors.grey[300]!,spreadRadius:0,blurRadius:6.0,
            ),
          ]
      ),
      child:ClipRRect(
        borderRadius:const BorderRadius.only(topRight:Radius.circular(30.0),topLeft:Radius.circular(30.0)),
        child: Obx(() => BottomNavigationBar(
          backgroundColor:Colors.white,
          iconSize:20.0,
          unselectedItemColor:AppColors.grey,
          unselectedFontSize:9.5,
          selectedFontSize:9.5,
          type:BottomNavigationBarType.fixed,
          fixedColor:AppColors.mainColor,
          currentIndex: controller.currentScreen.value,
          onTap: (int index){
            controller.setCurrentScreen = index;
          },
          items: const [
            BottomNavigationBarItem(
              label:'Home',
              icon:Icon(EvaIcons.homeOutline),
              activeIcon: Icon(EvaIcons.home),
            ),
            BottomNavigationBarItem(
              label: 'Sources',
              icon: Icon(EvaIcons.gridOutline),
              activeIcon: Icon(EvaIcons.grid),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(EvaIcons.searchOutline),
              activeIcon: Icon(EvaIcons.search),
            ),
          ],
        )),
      ),
    );
  }
}
