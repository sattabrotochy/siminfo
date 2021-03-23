import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:siminfoall/Widget/button_desgin.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScrenn extends StatefulWidget {
  @override
  _AboutScrennState createState() => _AboutScrennState();
}

class _AboutScrennState extends State<AboutScrenn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: boxColor,
        body: ListView(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    child: Image(
                      image: AssetImage('asset/drawer_image.png'),
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 35, left: 15),
                  //   child: Text(
                  //     'Power by ',
                  //     style: TextStyle(
                  //       fontSize: 14,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 50, left: 15),
                  //   child: Text('Syntaxive.tech',
                  //       style: TextStyle(fontSize: 20, color: Colors.green)),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 80, left: 15),
                  //   child: Text(
                  //     'info@syntaxive.tech',
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.w400,
                  //         fontStyle: FontStyle.italic),
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 100, left: 15),
                  //   child: Text(
                  //     '+8801763344438',
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.w400,
                  //         fontStyle: FontStyle.italic),
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 120, left: 15),
                  //   child: Text(
                  //     'www.syntaxive.tech',
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.w400,
                  //         fontStyle: FontStyle.italic),
                  //   ),
                  // ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  String url = "";
                  _launchURL(url);
                },
                child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green,
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "More Apps",
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Icon(
                              Icons.arrow_circle_down_sharp,
                              color: Colors.white,
                              size: 35,
                            )),
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Share.share("Hi, try downloading this amazing app from " +
                      "https://play.google.com/store/apps/details?id=com.syntaxive.qrcodescannertech");
                },
                child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green,
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "Share App",
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Icon(
                              Icons.share_outlined,
                              color: Colors.white,
                              size: 35,
                            )),
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  String url =
                      "http://shiftlog.tech/syntaxive-privacy-policy/all-sim-info/";
                  _launchURL(url);
                },
                child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green,
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "Privacy Policy",
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Icon(
                              Icons.privacy_tip_outlined,
                              color: Colors.white,
                              size: 35,
                            )),
                      ],
                    )),
              ),
            ),
          ],
        ));
  }
}




_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
