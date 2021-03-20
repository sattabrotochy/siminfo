import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:siminfoall/Model/Data_Model.dart';
import 'package:siminfoall/Widget/offerbutton.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Provider/provider.dart';


class AirtelScreen extends StatefulWidget {
  @override
  _AirtelScreenState createState() => _AirtelScreenState();
}

class _AirtelScreenState extends State<AirtelScreen>
    with SingleTickerProviderStateMixin {
  List<DataModel> airtelUSSDCodeList = [];
  List<DataModel> airtelinternetList = [];
  List<DataModel> airtelminuteList = [];

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
                        color: Colors.red,
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
    FlutterStatusbarcolor.setStatusBarColor(Colors.red);
    MyProvider provider = Provider.of<MyProvider>(context);

    /// ussd
    provider.getAirtelUssdCode();
    airtelUSSDCodeList = provider.throwairtelUSSDCODE;

    /// internet

    provider.getAirtelInternetList();
    airtelinternetList = provider.throwairtelinternetList;

    ///minute

    provider.getAirtelminuteList();
    airtelminuteList = provider.throwairtelminutelist;

    return Scaffold(
        body: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Airtel"),
          backgroundColor: Colors.red,
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
            airtelUSSDCodeList != null
                ? ListView.builder(
                    itemCount: airtelUSSDCodeList.length,
                    itemBuilder: (context, index) {
                      return button(
                        name: airtelUSSDCodeList[index].name,
                        number: airtelUSSDCodeList[index].number,
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    ),
                  ),

            /// internet airtel
            airtelinternetList != null
                ? ListView.builder(
                    itemCount: airtelinternetList.length,
                    itemBuilder: (context, index) {
                      return buttonoffer(
                        name: airtelinternetList[index].name,
                        number: airtelinternetList[index].number,
                        color: Colors.red,
                        context: context,
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    ),
                  ),

            /// minute list
            airtelminuteList != null
                ? ListView.builder(
                    itemCount: airtelminuteList.length,
                    itemBuilder: (context, index) {
                      return buttonoffer(
                        name: airtelminuteList[index].name,
                        number: airtelminuteList[index].number,
                        color: Colors.red,
                        context: context,
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    ),
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
