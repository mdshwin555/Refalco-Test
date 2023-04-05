import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  final RxInt pageInx = 1.obs;
  final PageController pageController = PageController(
      initialPage: 1
  );

  @override
  void onInit() {
    pageController.addListener(() {
      pageInx.value = pageController.page?.round() ?? 1;
    });
    super.onInit();
  }

  void toPage(int inx){
    pageController.animateToPage(
      inx,
      duration: Duration(milliseconds: 5),
      curve: Curves.easeOutQuint,
    );
  }

}