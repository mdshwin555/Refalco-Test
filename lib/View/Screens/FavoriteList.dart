import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../Constants/Images.dart';
import '../../Controllers/FavoritesController.dart';
import 'package:sizer/sizer.dart';

class FavoriteList extends StatelessWidget {
  final FavoriteOrdersController controller =
      Get.put(FavoriteOrdersController());

  // final OrderModel model;
  //
  // FavoriteList(this.model);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 10.h,),
              Lottie.asset(Images.favorites, width: 75.w),
              Text(
                'No Favorites Items Yet',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Alata",
                  fontSize: 17.sp,
                ),
              )
            ],
          ),
        )
        // Obx(() => ListView.builder(
        //   itemCount: controller.favoriteOrders.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     final order = controller.favoriteOrders[index];
        //     return ListTile(
        //       title: Text('name'),
        //       subtitle: Text('price'),
        //     );
        //   },
        // )),
        );
  }
}
