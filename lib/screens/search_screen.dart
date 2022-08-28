import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fruits_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/fruit_carousel.dart';
import '../components/market_card.dart';
import '../components/search_box.dart';
import '../models/market_model.dart';
import 'package:flutter/services.dart' as rootBundle;

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<List<MarketDataModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/data/fruits.json');
    // convert the data to list
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => MarketDataModel.fromJson(e)).toList();
  }

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
        // const SizedBox(height: 12),
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  color: kBackgroundColor,
                ),
              ),
              MarketCard(),
            ],
          ),
        ),
      ],
    );
  }
}
