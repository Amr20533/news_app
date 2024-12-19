import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app/views/screens/search_screen.dart';
import 'package:news_app/views/screens/starter_screen.dart';

class HomeController extends GetxController{

  List<Widget> screens = [
    const StarterScreen(),
    const SearchScreen(),
    Container(),
  ];

  final RxInt _currentScreen = 0.obs;
  RxInt get currentScreen => _currentScreen;

  set setCurrentScreen(int newScreenIndex){
    _currentScreen.value = newScreenIndex;
  }

}