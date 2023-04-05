import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'Controllers/FavoritesController.dart';
import 'Model/OrderModel.dart';
import 'package:intl/intl.dart';
import 'package:audioplayers/audioplayers.dart';

class AllInfo extends StatelessWidget {
  final OrderModel model;

  AllInfo(this.model);

  final FavoriteOrdersController iconController =
      Get.put(FavoriteOrdersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 30.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30.sp),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.75),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                image: DecorationImage(
                  image: NetworkImage(model.image),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 2.h,
                    left: 3.w,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 17.sp,
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Positioned(
                      top: 2.h,
                      right: 3.w,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 17.sp,
                        child: GestureDetector(
                          child: iconController.isFavorite.value
                              ? Icon(
                                  Icons.favorite,
                                  size: 18.sp,
                                  color: Colors.red,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  size: 18.sp,
                                  color: Colors.red,
                                ),
                          onTap: ()  {
                            iconController.toggleFavorite();
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8.h,
                    left: 38.w,
                    child: Text(
                      'Address',
                      style: TextStyle(
                        fontSize: 22.sp,
                        color: Colors.white,
                        fontFamily: 'Alata',
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15.h,
                    left: 5.w,
                    child: Container(
                      height: 10.h,
                      width: 40.w,
                      margin: EdgeInsets.only(
                          top: 2.h, bottom: 1.h, left: 1.w, right: 1.w),
                      padding: EdgeInsets.symmetric(
                        vertical: 2.h,
                        horizontal: 5.w,
                      ),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(20.sp)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'lon ',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.black,
                              fontFamily: 'Alata',
                            ),
                          ),
                          Text(
                            '${model.longitude}',
                            style: TextStyle(
                              fontSize: 19.sp,
                              color: Colors.black,
                              fontFamily: 'Alata',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15.h,
                    right: 5.w,
                    child: Container(
                      height: 10.h,
                      width: 40.w,
                      margin: EdgeInsets.only(
                          top: 2.h, bottom: 1.h, left: 1.w, right: 1.w),
                      padding: EdgeInsets.symmetric(
                        vertical: 2.h,
                        horizontal: 5.w,
                      ),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(20.sp)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'lat ',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.black,
                              fontFamily: 'Alata',
                            ),
                          ),
                          Text(
                            '${model.latitude}',
                            style: TextStyle(
                              fontSize: 19.sp,
                              color: Colors.black,
                              fontFamily: 'Alata',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              height: 35.h,
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  model.items.length,
                  (int index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: Duration(milliseconds: 375),
                      columnCount: 2,
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 1.h,
                              horizontal: 2.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.sp),
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xffbdc3c7),
                                  Color(0xff2c3e50),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 0.w,
                                bottom: 1.5.h,
                              ),
                              child: Stack(
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Positioned(
                                    left: -55,
                                    top: 10,
                                    child: Transform.rotate(
                                      angle: -45 * 3.14 / 180,
                                      child: Container(
                                        width: 50.w,
                                        height: 4.h,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(
                                            25.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 3.h,
                                    left: 1.5.w,
                                    child: Transform.rotate(
                                      angle: -45 * 3.14 / 180,
                                      child: Text(
                                        '${model.items[index].price.toDouble()}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Alata'),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 12.5.h,
                                    left: 2.w,
                                    child: Container(
                                      width: 40.w,
                                      child: Text(
                                        '${model.items[index].name}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Alata'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Center(
              child: Text(
                'Created At :',
                style: TextStyle(
                    color: Colors.white, fontSize: 17.sp, fontFamily: 'Alata'),
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Center(
              child: Text(
                DateFormat()
                    .add_yMMMEd()
                    .format(DateTime.parse(model.created_at)),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontFamily: 'Alata',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
