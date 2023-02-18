import 'package:carousel_slider/carousel_slider.dart';
import 'package:dd_property/widgets/show_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShowCarousel extends StatefulWidget {
  List? imageSliders;
  ShowCarousel({super.key, required this.imageSliders});

  @override
  State<ShowCarousel> createState() => _ShowCarouselState();
}

class _ShowCarouselState extends State<ShowCarousel> {
  @override
  Widget build(BuildContext context) {
    final CarouselController _controller = CarouselController();
    int _current = 0;

    return Column(children: [
      Expanded(
        child: CarouselSlider(
          items: widget.imageSliders!
              .map((image) => showNetworImage(url: image['src']))
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                  print("object=======================");
                  print(_current);
                });
              }),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.imageSliders!.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () {
              print("entry.key ########################");
              print(entry.key);
              _controller.animateToPage(entry.key);
            }, // => _controller.animateToPage(entry.key),
            child: Container(
              width: 12.0,
              height: 12.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
