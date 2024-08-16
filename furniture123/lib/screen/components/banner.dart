import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSection extends StatelessWidget {
  final PageController pageController;
  final List<String> imagePaths;
  final bool showPoint;
  final String? bannerText; // Banner text parameter

  const BannerSection({
    required this.pageController,
    required this.imagePaths,
    required this.showPoint,
    this.bannerText, // Optional banner text
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      height: MediaQuery.of(context).size.height * 0.25,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: PageView(
              controller: pageController,
              children: imagePaths
                  .map((path) => Image.asset(
                        path,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
            ),
          ),
          if (showPoint)
            Positioned(
              bottom: 10.0,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: imagePaths.length,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 8.0,
                    dotWidth: 8.0,
                    activeDotColor: Colors.black,
                    dotColor: Colors.white,
                  ),
                ),
              ),
            ),
          if (bannerText != null)
            Positioned(
              top: 8.0,
              right: -25.0,
              child: Transform.rotate(
                angle: 0.5, // Adjust angle for tilt
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35.0, vertical: 2.0),
                  decoration: BoxDecoration(
                    color: Colors.yellow
                        .withOpacity(0.9), // Yellow background with opacity
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    bannerText!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
