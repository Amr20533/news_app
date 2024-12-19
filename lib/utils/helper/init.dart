import 'package:get/get.dart';
import 'package:news_app/core/controllers/home_controller.dart';
import 'package:news_app/core/controllers/news_controller.dart';
import 'package:news_app/core/dependencies/api_client.dart';
import 'package:news_app/core/repositories/news_repo.dart';
import 'package:news_app/utils/static/app_constants.dart';

Future<void> init()async{
  //Api Clients
  Get.lazyPut(()=>ApiClient(appBaseUrl:AppConstants.baseUrl));
  //Repositories
  Get.lazyPut(()=>NewsRepo(apiClient:Get.find()));
  //Controllers
  Get.lazyPut(()=>NewsController(repo:Get.find()));
  Get.lazyPut(()=>HomeController());

}