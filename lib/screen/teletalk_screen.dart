
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siminfoall/Model/Data_Model.dart';
import 'package:siminfoall/Widget/offerbutton.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Provider/provider.dart';
import 'package:provider/provider.dart';

class TeletalkScreen extends StatefulWidget {
  @override
  _TeletalkScreenState createState() => _TeletalkScreenState();
}

class _TeletalkScreenState extends State<TeletalkScreen>
    with SingleTickerProviderStateMixin {
  List<DataModel> teletalkUSSDCodeList = [];
  List<DataModel> teletalkInternetList = [];
  List<DataModel> teletalkMinuteList = [];
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
                        color: Colors.green,
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
    FlutterStatusbarcolor.setStatusBarColor(Colors.green);

    MyProvider provider = Provider.of<MyProvider>(context);

    /// ussd
    provider.getTeletalkUSSDcode();
    teletalkUSSDCodeList = provider.throwTeletalkUSSDCode;

    /// internet

    provider.getteletalkinternetlist();
    teletalkInternetList = provider.throwteletalkinternetlist;

    /// minute

    provider.getteletalkminuteList();
    teletalkMinuteList = provider.throwteletalkminuteList;

    return Scaffold(
        body: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
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
              itemCount: teletalkUSSDCodeList.length,
              itemBuilder: (context, index) {
                return button(
                  name: teletalkUSSDCodeList[index].name,
                  number: teletalkUSSDCodeList[index].number,
                );
              },
            ),

            /// internet

            ListView.builder(
              itemCount: teletalkInternetList.length,
              itemBuilder: (context, index) {
                return buttonoffer(
                  name: teletalkInternetList[index].name,
                  number: teletalkInternetList[index].number,
                  color: Colors.green,
                  context: context,
                );
              },
            ),

            /// minute

            ListView.builder(
              itemCount: teletalkMinuteList.length,
              itemBuilder: (context, index) {
                return buttonoffer(
                  name: teletalkMinuteList[index].name,
                  number: teletalkMinuteList[index].number,
                  color: Colors.green,
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
