import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';
import 'package:technical_test/FavoriteList.dart';
import 'package:technical_test/Model/OrderModel.dart';
import 'Constants/Images.dart';
import 'Controllers/HomeController.dart';
import 'Controllers/OrdersController.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'ShowView.dart';

class Home extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Order List'),
      ),
      body: PageView(
        //physics: NeverScrollableScrollPhysics(),
        controller: homeController.pageController,
        children: [
          FutureBuilder<dynamic>(
            future: OrdersController.getOrders(),
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        Images.loading,
                        height: 10.h,
                      ),
                      Text(
                        'Loading',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return AnimationLimiter(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(
                      snapshot.data.length,
                          (int index) {
                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: Duration(milliseconds: 375),
                          columnCount: 2,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: ShowView(snapshot.data[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      Lottie.asset(
                        Images.noitems,
                        height: 30.h,
                      ),
                      Text(
                        'noitems',
                        style: TextStyle(
                          //fontFamily: Fonts.h,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          FavoriteList(),
        ],
      ),

      bottomNavigationBar: GetX<HomeController>(builder: (controller) {
        return CircleNavBar(
          cornerRadius: BorderRadius.vertical(
            top: Radius.circular(25.sp),
            bottom: Radius.circular(25.sp),
          ),
          padding: EdgeInsets.only(bottom: 2.h, left: 5.w, right: 5.w),
          circleColor: Color(0xff454545),
          activeIcons: [
            Icon(CupertinoIcons.house_fill),
            Icon(CupertinoIcons.heart_fill),
          ],
          inactiveIcons: [
            Icon(
              CupertinoIcons.home,
              color: Color(0xff454545),
            ),
            Icon(
              CupertinoIcons.heart,
              color: Color(0xff454545),
            ),
          ],
          color: Color(0xffE8E2E2),
          height: 8.h,
          activeIndex: controller.pageInx.value,
          onTap: (index) => controller.toPage(index),
          circleWidth: 8.h,
          iconDurationMillSec: 400,
          tabCurve: Curves.easeOutQuart,
        );
      }),
    );
  }
}
