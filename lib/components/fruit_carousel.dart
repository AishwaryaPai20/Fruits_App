import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fruits_app/constants.dart';

class FruitCarousel extends StatefulWidget {
  const FruitCarousel({Key? key}) : super(key: key);

  @override
  State<FruitCarousel> createState() => _FruitCarouselState();
}

class CardItem {
  final String image;
  final String title;

  const CardItem({
    required this.image,
    required this.title,
  });
}

class _FruitCarouselState extends State<FruitCarousel> {
  int _currentIndex = 0;

// contains the image path
  List<CardItem> fruits = [
    CardItem(
      image: 'assets/images/image 1.png',
      title: 'Apple',
    ),
    CardItem(
      image: 'assets/images/image 2.png',
      title: 'Mangoes',
    ),
    CardItem(
      image: 'assets/images/image 3.png',
      title: 'Grapes',
    ),
    CardItem(
      image: 'assets/images/image 5.png',
      title: 'Lemons',
    ),
    CardItem(
      image: 'assets/images/image 4.png',
      title: 'Watermelon',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      margin: EdgeInsets.all(13),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (context, _) => SizedBox(
          width: 21,
        ),
        itemBuilder: (context, index) => buildCard(item: fruits[index]),
      ),
    );
  }

  Widget buildCard({
    required CardItem item,
  }) =>
      Container(
          width: 64,
          height: 64,
          color: kBackgroundColor,
          child: Column(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      item.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                item.title,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ));
}
