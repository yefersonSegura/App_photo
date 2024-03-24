import 'package:app_photo/shared/my_assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarrucelWidget extends StatefulWidget {
  const CarrucelWidget({super.key});

  @override
  State<CarrucelWidget> createState() => _CarrucelWidgetState();
}

class _CarrucelWidgetState extends State<CarrucelWidget> {
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 180,
      child: CarouselSlider(
        items: [
          itemSlider(MyAssets.sl1, MyAssets.ph1, 'Ryan Williams'),
          itemSlider(MyAssets.sl2, MyAssets.ph2, 'Ethan Johnson'),
          itemSlider(MyAssets.sl3, MyAssets.ph3, 'Jason Martinez'),
          itemSlider(MyAssets.sl4, MyAssets.ph4, 'Matthew Taylor'),
          itemSlider(MyAssets.sl5, MyAssets.ph5, 'Andrew Robinson'),
        ],
        carouselController: buttonCarouselController,
        options: CarouselOptions(
          height: double.infinity,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
          aspectRatio: 2.0,
          initialPage: 2,
          enlargeFactor: 0.2,
        ),
      ),
    );
  }

  Container itemSlider(String img, String profile, String namePhotographer) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: Colors.orange.withOpacity(0.5),
          width: 2.0,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
              width: double.infinity,
              height: 70,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(profile),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Picture taken by',
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.6)),
                        ),
                        Text(
                          namePhotographer,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
