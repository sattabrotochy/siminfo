
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:siminfoall/Model/Data_Model.dart';
import 'package:siminfoall/Widget/offerbutton.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Provider/provider.dart';

class RobiScreen extends StatefulWidget {
  @override
  _RobiScreenState createState() => _RobiScreenState();
}

class _RobiScreenState extends State<RobiScreen>
    with SingleTickerProviderStateMixin {
  List<DataModel> robiUSSDCodeList = [];
  List<DataModel> robiInternetList = [];
  List<DataModel> robiMinuteList = [];
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Widget button({String name, String number}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(13),
                    bottomRight: Radius.circular(13),
                    topLeft: Radius.circular(13),
                    bottomLeft: Radius.circular(13)),
                color: Colors.white,
                boxShadow: [BoxShadow()]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                  height: 70,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(13),
                      bottomRight: Radius.circular(13),
                      topLeft: Radius.circular(13),
                      bottomLeft: Radius.circular(13),
                    ),
                  ),
                  child: ClipPath(
                    clipper: MyCustomClipper(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(13),
                          bottomRight: Radius.circular(13),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            launch("tel://" + number.toString());
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 60),
                          child: Center(
                            child: Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.pink);
    MyProvider provider = Provider.of<MyProvider>(context);

    ///ussd
    provider.getRobiUssdCode();
    robiUSSDCodeList = provider.throwRobiUSSDCode;

    ///internet

    provider.getrobiInternetList();
    robiInternetList = provider.throwrobiInternetList;

    /// minute
    provider.getrobiminutelist();
    robiMinuteList = provider.throwrobiminutelist;

    return Scaffold(
        body: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Robi'),
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white.withOpacity(0.5),
            labelStyle: GoogleFonts.notoSans(
                fontSize: 16.0, fontWeight: FontWeight.w700),
            unselectedLabelStyle: GoogleFonts.notoSans(
                fontSize: 12.0, fontWeight: FontWeight.w500),
            tabs: [
              Tab(child: Text('USSD Codes')),
              Tab(child: Text('Internet Offer')),
              Tab(child: Text('Minute Offer')),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(
              itemCount: robiUSSDCodeList.length,
              itemBuilder: (context, index) {
                return button(
                  name: robiUSSDCodeList[index].name,
                  number: robiUSSDCodeList[index].number,
                );
              },
            ),

            /// internet

            ListView.builder(
              itemCount: robiInternetList.length,
              itemBuilder: (context, index) {
                return buttonoffer(
                  name: robiInternetList[index].name,
                  number: robiInternetList[index].number,
                  color: Colors.pink,
                  context: context,
                );
              },
            ),

            ///minute

            ListView.builder(
              itemCount: robiMinuteList.length,
              itemBuilder: (context, index) {
                return buttonoffer(
                  name: robiMinuteList[index].name,
                  number: robiMinuteList[index].number,
                  color: Colors.pink,
                  context: context,
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2, 0.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(MyCustomClipper oldClipper) => true;
}
