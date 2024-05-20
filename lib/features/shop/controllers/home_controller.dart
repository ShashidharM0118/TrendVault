
import 'package:get/get.dart';

class HomeController extends GetxController{

 static HomeController get instance => Get.find();
 final carousalCurrentIndex = 0.obs; //points at the required index
 void updatePageIndicator(index) {
   carousalCurrentIndex.value = index;
}
}