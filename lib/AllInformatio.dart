import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'Model/OrderModel.dart';

class AllInfo extends StatelessWidget {
  final OrderModel model;

  AllInfo(this.model);

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
                          top: 2.h,
                          bottom: 1.h,
                          left: 1.w,
                          right: 1.w
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 2.h,
                        horizontal: 5.w,
                      ),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(20.sp)
                      ),
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
                          top: 2.h,
                          bottom: 1.h,
                          left: 1.w,
                          right: 1.w
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 2.h,
                        horizontal: 5.w,
                      ),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(20.sp)
                      ),
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
            Container(
              height: 10.h,
              width: 100.w,
              margin: EdgeInsets.only(
               top: 3.h,
                bottom: 1.h,
                left: 1.w,
                right: 1.w
              ),
              padding: EdgeInsets.symmetric(
                vertical: 2.h,
                horizontal: 5.w,
              ),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Color(0xff434242),
                borderRadius: BorderRadius.circular(20.sp)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'name ',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.white,
                      fontFamily: 'Alata',
                    ),
                  ),
                  Text(
                    '${model.items[0].name}',
                    style: TextStyle(
                      fontSize: 19.sp,
                      color: Colors.white,
                      fontFamily: 'Alata',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 10.h,
              width: 100.w,
              margin: EdgeInsets.only(
                  top: 2.h,
                  bottom: 1.h,
                  left: 1.w,
                  right: 1.w
              ),
              padding: EdgeInsets.symmetric(
                vertical: 2.h,
                horizontal: 5.w,
              ),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Color(0xff434242),
                  borderRadius: BorderRadius.circular(20.sp)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'price ',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.white,
                      fontFamily: 'Alata',
                    ),
                  ),
                  Text(
                    '${model.items[0].price}',
                    style: TextStyle(
                      fontSize: 19.sp,
                      color: Colors.white,
                      fontFamily: 'Alata',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
