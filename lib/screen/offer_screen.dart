
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siminfoall/Widget/button_desgin.dart';

import '../offerScreen/airtel_offer_screen.dart';
import '../offerScreen/banglalink_offer_screen.dart';
import '../offerScreen/gp_offer_screen.dart';
import '../offerScreen/robi_offer_screen.dart';
import '../offerScreen/teletalk_offer_screen.dart';

class OfferScreen extends StatefulWidget {
  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  final item = [
    NetworkImage(
        'https://cdn01.grameenphone.com/sites/default/files/GP_Offer_Voice_10_Minutes_mobile_inner_0.jpg'),
    NetworkImage(
        'https://i.pinimg.com/736x/cb/ac/81/cbac81bf28b0a0eb03bf34331e0ff12b.jpg'),
    NetworkImage(
        'https://internetpackageoffer.com/wp-content/uploads/2020/04/Banglalink-new-SIM-offer-2020.jpg'),
    NetworkImage(
        "https://i.pinimg.com/736x/67/2e/3c/672e3cfc9bb96c125fd3c132695e4dbd.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: boxColor,
        body: ListView(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: SizedBox(
                child: Carousel(
                  images: item,
                  autoplay: true,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(milliseconds: 1000),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
                padding: EdgeInsets.only(left: 0.0),
                child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey.withOpacity(0.5),
                    labelStyle: GoogleFonts.notoSans(
                        fontSize: 16.0, fontWeight: FontWeight.w700),
                    unselectedLabelStyle: GoogleFonts.notoSans(
                        fontSize: 12.0, fontWeight: FontWeight.w500),
                    tabs: [
                      Tab(child: Text('Grameenphone',style: TextStyle(color: Colors.blue),)),
                      Tab(child: Text('Airtel',style: TextStyle(color: Colors.red),)),
                      Tab(child: Text('Robi',style: TextStyle(color: Colors.pink),)),
                      Tab(child: Text('Banglalink',style: TextStyle(color: Colors.deepOrange),)),
                      Tab(child: Text('Teletalk',style: TextStyle(color: Colors.green),)),
                    ])),
            Container(
                height: MediaQuery.of(context).size.height - 450.0,
                child: TabBarView(controller: _tabController, children: [
                  GPOfferScreen(),
                  AirtelOfferScreen(),
                  RobiOfferScreen(),
                  BanglalinkOfferScreen(),
                  TeletalkOfferScreen(),
                ]))
          ],
        ));
  }
}
