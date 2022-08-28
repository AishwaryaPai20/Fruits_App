import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';

import '../constants.dart';
import '../models/market_model.dart';
import 'market_card.dart';

class EnquiryDetail extends StatefulWidget {
  final MarketDataModel marketDataModel;
  EnquiryDetail({
    Key? key,
    required this.marketDataModel,
  }) : super(key: key);

  @override
  State<EnquiryDetail> createState() => _EnquiryDetailState();
}

class _EnquiryDetailState extends State<EnquiryDetail> {
  List<Message> messages = [
    Message(
      // ignore: prefer_interpolation_to_compose_strings
      text: 'Hello Buyer we have the product ready to ship',
      date: DateTime.now().subtract(
        Duration(minutes: 1),
      ),
      isSentByMe: false,
    ),
    Message(
      text: "Do let me know",
      date: DateTime.now().subtract(
        Duration(minutes: 4),
      ),
      isSentByMe: false,
    ),
    Message(
      text: "How fast can you deliver?",
      date: DateTime.now().subtract(
        Duration(minutes: 8),
      ),
      isSentByMe: true,
    ),
    Message(
      text: "What are the payment Terms?",
      date: DateTime.now().subtract(
        Duration(minutes: 10),
      ),
      isSentByMe: true,
    ),
    Message(
      text: "Is it fresh",
      date: DateTime.now().subtract(
        Duration(minutes: 50),
      ),
      isSentByMe: true,
    )
  ].toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDetailBGColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.marketDataModel.seller.toString(),
          style: TextStyle(
            color: kTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: 82,
            height: 19,
            margin: EdgeInsets.all(15),
            child: Text(
              'Lot Details',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Colors.black,
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 41,
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
                        widget.marketDataModel.seller.toString(),
                        style: GoogleFonts.inter(
                          textStyle: Theme.of(context).textTheme.headline4,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.marketDataModel.product.toString(),
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.headline4,
                              color: kTextColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Product',
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.headline4,
                              color: kTextLightColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            widget.marketDataModel.avgWeight.toString() + 'gms',
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.headline4,
                              color: kTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'avg weight',
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.headline4,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.marketDataModel.variety.toString(),
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.headline4,
                              color: kTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Variety',
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.headline4,
                              color: kTextLightColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            widget.marketDataModel.perBox.toString() + ' kg',
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.headline4,
                              color: kTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'per Box',
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.headline4,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\u{20B9}${widget.marketDataModel.price.toString()}',
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.headline4,
                              color: kGreenColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 27.5,
                          ),
                          Text(
                            widget.marketDataModel.boxes.toString(),
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.headline4,
                              color: kTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Boxes',
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.headline4,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 45,
                          ),
                          Text(
                            widget.marketDataModel.delivery.toString(),
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.headline4,
                              color: kTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Delivery',
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.headline4,
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
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 80,
                  ),
                  child: GroupedListView<Message, DateTime>(
                    padding: const EdgeInsets.all(8),
                    reverse: true,
                    order: GroupedListOrder.DESC,
                    elements: messages,
                    groupBy: (message) => DateTime(2022),
                    groupHeaderBuilder: (Message message) => SizedBox(),
                    itemBuilder: (context, Message message) => Align(
                      alignment: message.isSentByMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 2),
                        decoration: BoxDecoration(
                          color: message.isSentByMe
                              ? Color(0xFF27AE60)
                              : kPrimaryColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                              bottomLeft:
                                  Radius.circular(message.isSentByMe ? 4 : 0),
                              bottomRight:
                                  Radius.circular(message.isSentByMe ? 0 : 4)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            message.text,
                            style: GoogleFonts.inter(
                              color: message.isSentByMe
                                  ? kPrimaryColor
                                  : kTextLightColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 282.5,
                      height: 40,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Type your message here',
                        ),
                        onSubmitted: (text) {
                          final message = Message(
                            text: text,
                            date: DateTime.now(),
                            isSentByMe: true,
                          );

                          setState(() => messages.add(message));
                        },
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFF27AE60),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.send,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;

  Message({
    required this.text,
    required this.date,
    required this.isSentByMe,
  });
}
