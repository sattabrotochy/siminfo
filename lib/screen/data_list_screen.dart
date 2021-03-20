
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:siminfoall/Model/Data_Model.dart';
import 'package:siminfoall/Widget/offerbutton.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Provider/provider.dart';

class DataListScreen extends StatefulWidget {
  @override
  _DataListScreenState createState() => _DataListScreenState();
}

class _DataListScreenState extends State<DataListScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<DataModel> gpUSSDList = [];
  List<DataModel> gpinternetList = [];
  List<DataModel> gpminuteList = [];

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
                boxShadow: [
                  BoxShadow(
                      color: Colors.blue.withOpacity(0.5), offset: Offset.zero)
                ]),
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
                        color: Colors.blue,
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
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.blue);
    MyProvider provider = Provider.of<MyProvider>(context);

    /// ussd list
    provider.getGpUssdCode();
    gpUSSDList = provider.throwGPUSSDCode;

    /// internet list

    provider.getGpInternetList();
    gpinternetList = provider.throwgpInternetlist;

    ///minute list

    provider.getGpminuteList();
    gpminuteList = provider.throwgpminutelist;

    return Scaffold(
        body: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
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
            gpUSSDList != null
                ? ListView.builder(
                    itemCount: gpUSSDList.length,
                    itemBuilder: (context, index) {
                      return button(
                        name: gpUSSDList[index].name,
                        number: gpUSSDList[index].number,
                        //  Color: gpUSSDList[index].color,
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),

            /// gp internet
            gpinternetList != null
                ? ListView.builder(
                    itemCount: gpinternetList.length,
                    itemBuilder: (context, index) {
                      return buttonoffer(
                        name: gpinternetList[index].name,
                        number: gpinternetList[index].number,
                        color: Colors.blue,
                        context: context,
                        //  Color: gpUSSDList[index].color,
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),

            /// gp  minute list
            gpminuteList != null
                ? ListView.builder(
                    itemCount: gpminuteList.length,
                    itemBuilder: (context, index) {
                      return buttonoffer(
                        name: gpminuteList[index].name,
                        number: gpminuteList[index].number,
                        color: Colors.blue,
                        context: context,
                        //  Color: gpUSSDList[index].color,
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
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
