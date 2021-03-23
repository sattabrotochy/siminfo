import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:siminfoall/Widget/button_desgin.dart';
import 'package:siminfoall/screen/about_screen.dart';
import 'package:siminfoall/screen/data_list_screen.dart';
import 'package:siminfoall/screen/offer_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current_state;

  String offer;


  Future getNewOffer() async
  {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('ajkerOffer').get();

    querySnapshot.docs.forEach((element) {

      offer=element.data()['name'];

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    current_state = 0;
  }





  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.blue);

    getNewOffer();
    return Scaffold(
        backgroundColor: boxColor,
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: boxColor,
          buttonBackgroundColor: boxColor,
          height: 50,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            setState(() {
              current_state = index;
            });
          },
          letIndexChange: (index) => true,
          items: [
            Icon(
              Icons.home,
              color: Colors.blue,
            ),
            Icon(
              Icons.wallet_giftcard,
              color: Colors.blue,
            ),
            Icon(
              Icons.menu,
              color: Colors.blue,
            ),
          ],
        ),
        body: (current_state == 0)
            ? ListView(
                children: [
                      Container(
                        width: double.infinity,
                        child: Image(
                          image: AssetImage('asset/home_back2.jpg'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Container(
                          child: Stack(
                            children: [
                              Container(
                                height: 70,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Colors.purple[200].withOpacity(0.1),
                                      blurRadius: 6.0,
                                      spreadRadius: 4.0,
                                      offset: Offset(5.0, 11.0),
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: ()
                                {
                                  showDialogFunc(context,offer);
                                },
                                child: Container(
                                    height: 70,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: Colors.blue[400],
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin:EdgeInsets.only(left: 20),
                                          child: Image(
                                            height: 40,
                                            width: 40,
                                            image: AssetImage('asset/surprise.png'),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: Text(
                                            "New Offer View",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),

                  SizedBox(
                    height: 17,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonDesgin(
                          name: 'Airtel',
                          image: 'asset/airtel.png',
                          onTap: 'airtel'),

                      SizedBox(width: 20,),
                      ButtonDesgin(
                          name: 'Robi', image: 'asset/robi.png', onTap: 'robi'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DataListScreen()));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 30),
                                      height: 100,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          color: boxColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: kIShadow),
                                      child: Container(
                                        margin: EdgeInsets.only(top: 50),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Grameenphone ',
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(
                                            top: 10, left: 40.5),
                                        alignment: Alignment.centerLeft,
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            color: boxColor,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            boxShadow: kIShadow),
                                        child: Image(
                                          image: AssetImage('asset/gp.png'),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      ButtonDesgin(
                          name: 'banglalink ',
                          image: 'asset/banglalink.png',
                          onTap: 'banglalink'),
                      SizedBox(width: 20,),
                      ButtonDesgin(
                          name: 'teletalk ',
                          image: 'asset/teletalk.png',
                          onTap: 'teletalk'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )
            : (current_state == 1)
                ? Container(
                    child: OfferScreen(),
                  )
                : Container(
                    child: AboutScrenn(),
                  ));
  }
}
showDialogFunc(context, title) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 200,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
