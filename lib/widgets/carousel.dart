import 'package:flutter/material.dart';

import 'animated_dot.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  List<String> carouselImages = [
    'assets/images/carousel-1.jpg',
    'assets/images/carousel-2.jpg',
    'assets/images/carousel-3.jpg',
    'assets/images/carousel-4.jpg',
  ];
  final PageController _pageController = PageController(initialPage: 0);
  late double dotSize = 10;
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.27,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.24,
            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  pageIndex = value;
                });
              },
              controller: _pageController,
              itemCount: carouselImages.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  carouselImages[index],
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                );
              },
            ),
          ),
          AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              int currentPage = pageIndex;
              return Container(
                padding: EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(carouselImages.length, (index) {
                    bool isSelected = index == currentPage;
                    return AnimatedDot(
                      isSelected: isSelected,
                      dotSize: isSelected ? dotSize * 1.5 : dotSize,
                    );
                  }),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
