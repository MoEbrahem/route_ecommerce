import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:route_ecommerce/core/resources/ColorManager.dart';
import 'package:route_ecommerce/features/HomeScreen/cubit/home_View_Model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AnnouncementHomescreen extends StatefulWidget {
  const AnnouncementHomescreen({super.key});

  @override
  State<AnnouncementHomescreen> createState() => _AnnouncementHomescreenState();
}

class _AnnouncementHomescreenState extends State<AnnouncementHomescreen> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: HomeViewModel.imagesList,
          options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 1.2 / 0.65,
              onPageChanged: (i, r) {
                setState(() {
                  _current = i;
                });
              }),
        ),
        Positioned(
          bottom: 0,
          left: 125,
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            child: AnimatedSmoothIndicator(
              activeIndex: _current,
              count: HomeViewModel.imagesList.length,
              
              effect: const ExpandingDotsEffect(
                dotColor: ColorManager.white,
                activeDotColor: ColorManager.primary,
                dotWidth: 9,
                dotHeight: 9,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
