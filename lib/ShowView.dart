import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'AllInformatio.dart';
import 'Model/OrderModel.dart';

class ShowView extends StatelessWidget {
  final OrderModel model;

  ShowView(this.model);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(AllInfo(model));
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 1.h,
          horizontal: 2.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.sp),
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.50),
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
        child: Padding(
          padding: EdgeInsets.only(
            left: 3.w,
            bottom: 1.5.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30.w,
                      top: 2.h,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        size: 20.sp,
                      ),
                      color: Colors.red,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 6.h,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'total ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Alata'),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          model.total,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Alata'),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          model.currency,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Alata'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
