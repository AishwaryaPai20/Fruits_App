import 'package:flutter/material.dart';
import 'package:fruits_app/constants.dart';

import '../components/fruit_carousel.dart';
import '../components/search_box.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: crossAxisAlignment.,
      children: <Widget>[
        Row(
          children: [
            SearchBox(
              onChanged: (value) {},
            ),
            IconButton(
              icon: Icon(
                Icons.sort,
              ),
              onPressed: () {},
            ),
            Text("Sort"),
          ],
        ),
        FruitCarousel(),
        // FruitCarousel(),
      ],
    );
  }
}
