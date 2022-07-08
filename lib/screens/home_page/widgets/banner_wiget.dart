import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:puja_path/getx/home_getx_controller.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/utils.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeGetxController>(
      builder: (controller) => controller.homeBannerModel != null
          ? controller.homeBannerModel!.data!.isNotEmpty
              ? CarouselSlider.builder(
                  itemCount: controller.homeBannerModel!.data!.length,
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    viewportFraction: 0.9,
                    autoPlay: true,
                  ),
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      GestureDetector(
                    onTap: () => Utils.launchURL(
                        controller.homeBannerModel!.data![itemIndex].url!),
                    child: CachedNetworkImage(
                      imageUrl:
                          controller.homeBannerModel!.data![itemIndex].image!,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                            strokeWidth: 2.0,
                          ),
                        ),
                      ),
                      height: 160.r,
                      fit: BoxFit.contain,
                      width: double.infinity,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ).addMargin(),
                  ),
                ).addMargin(margin: EdgeInsets.symmetric(vertical: 30.r))
              : Container()
          : Container(),
    );
  }
}
