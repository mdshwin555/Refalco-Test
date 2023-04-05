import 'package:get/get.dart';

class FavoriteOrdersController extends GetxController {
  // RxBool to track the current state of the icon
  RxBool isFavorite = false.obs;

  // Function to toggle the state of the icon
  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }
}
