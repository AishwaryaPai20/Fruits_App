import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/market_model.dart';
import 'package:flutter/services.dart' as rootBundle;
import '../constants.dart';
import 'enquiry_detail.dart';

class MarketCard extends StatefulWidget {
  const MarketCard({
    Key? key,
  }) : super(key: key);

  @override
  State<MarketCard> createState() => _MarketCardState();
}

class _MarketCardState extends State<MarketCard> {
  Future<List<MarketDataModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/data/fruits.json');
    // convert the data to list
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => MarketDataModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(
              child: Text('${data.error}'),
            );
          } else if (data.hasData) {
            var items = data.data as List<MarketDataModel>;
            return ListView.builder(
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return SafeArea(
                    bottom: false,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 5,
                      ),
                      decoration: const BoxDecoration(
                        color: kSecondaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(
                              0,
                              1,
                            ),
                            blurRadius: 1.0,
                          ),
                        ],
                      ),
                      height: 152,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EnquiryDetail(
                                marketDataModel: items[index],
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 47,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            Positioned(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                                child: Container(
                                  height: 16,
                                  width: double.infinity,
                                  child: Text(
                                    items[index].seller.toString(),
                                    style: GoogleFonts.inter(
                                      textStyle:
                                          Theme.of(context).textTheme.headline4,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 50,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                                child: Container(
                                  height: 105,
                                  width: 344 / 4,
                                  margin: const EdgeInsets.all(2),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        items[index].product.toString(),
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          color: kTextColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        'Product',
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          color: kTextLightColor,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        items[index].avgWeight.toString() +
                                            'gms',
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          color: kTextColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        'avg weight',
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          color: kTextLightColor,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 50,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 104,
                                  vertical: 10,
                                ),
                                child: Container(
                                  height: 105,
                                  width: 344 / 4,
                                  margin: const EdgeInsets.all(2),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        items[index].variety.toString(),
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          color: kTextColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        'Variety',
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          color: kTextLightColor,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        items[index].perBox.toString() + ' kg',
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          color: kTextColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        'per Box',
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          color: kTextLightColor,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 50,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 192,
                                  vertical: 10,
                                ),
                                child: Container(
                                  height: 105,
                                  width: 344 / 4,
                                  margin: const EdgeInsets.all(2),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 73,
                                        height: 21,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(33, 33, 33, 0.08),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Text(
                                          '\u{20B9}${items[index].price.toString()}',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: kGreenColor,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 27.5,
                                      ),
                                      Text(
                                        items[index].boxes.toString(),
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          color: kTextColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        'Boxes',
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          color: kTextLightColor,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 50,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 280,
                                  vertical: 10,
                                ),
                                child: Container(
                                  height: 105,
                                  width: 344 / 4,
                                  margin: const EdgeInsets.all(2),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 45,
                                      ),
                                      Text(
                                        items[index].delivery.toString(),
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          color: kTextColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        'Delivery',
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          color: kTextLightColor,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
