import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../Constants/Images.dart';
import '../../Controllers/FavoritesController.dart';
import '../../Model/OrderModel.dart';
import '../Widgets/ShowView.dart';
import 'AllInformatio.dart';

class FavoriteScreen extends StatelessWidget {
  final List<OrderModel> favoriteOrders;

  FavoriteScreen({required this.favoriteOrders});
  final FavoriteOrdersController iconController =
  Get.put(FavoriteOrdersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorate List'),
        centerTitle: true,
        toolbarHeight: 10.h,
        foregroundColor: Colors.white, // sets the text color of the AppBar
        iconTheme: IconThemeData(
          color: Colors.white, // sets the color of the icons in the AppBar
        ),
        titleTextStyle: TextStyle(
          fontSize: 25.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Alata',

        ),
      ),
      backgroundColor: Colors.black,
      body: favoriteOrders.length==0?Center(
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
      ):Container(
        height: 85.h,
        child:AnimationLimiter(
          child: GridView.count(
           // controller: _scrollController,
            crossAxisCount: 2,
            children: List.generate(
               favoriteOrders.length,
                  (int index) {
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: Duration(milliseconds: 375),
                  columnCount: 2,
                  child: ScaleAnimation(
                    child: FadeInAnimation(
                      child: ShowView(favoriteOrders[index]),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

