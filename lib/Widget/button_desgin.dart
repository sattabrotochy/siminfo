import 'package:flutter/material.dart';
import 'package:siminfoall/screen/airtel_screen.dart';
import 'package:siminfoall/screen/robi_screen.dart';
import '../screen/banglalink_screen.dart';
import '../screen/teletalk_screen.dart';

Color textColor = Color(0xff3E67D6);

//Color boxColor = Colors.grey[200];
Color boxColor = Color(0xFFEFF3FF);

final kboxShadow = [
  BoxShadow(color: Colors.white, offset: Offset(-10, -10), blurRadius: 10),
  BoxShadow(
      color: Colors.white.withOpacity(.29),
      offset: Offset(4, 4),
      blurRadius: 15)
];
final kIShadow = [
  BoxShadow(
      color: Colors.black.withOpacity(.15),
      //blurRadius: 1,
      spreadRadius: 2,
      offset: Offset(-1, 1)),
  BoxShadow(
      color: Colors.white.withOpacity(.7),
      spreadRadius: 2,
      offset: Offset(1, -1)),
  BoxShadow(
      color: Colors.black.withOpacity(.15),
      spreadRadius: 2,
      //  blurRadius: 1,
      offset: Offset(-1, -1)),
  BoxShadow(
      color: Colors.white.withOpacity(.7),
      spreadRadius: 2,
      offset: Offset(1, 1)),
];

Widget ButtonDesgin({String name, String image, String onTap}) {
  return Builder(
    builder: (context) => Padding(
      padding: EdgeInsets.all(0.0),
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (onTap == 'airtel') {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AirtelScreen()));
                      } else if (onTap == 'robi') {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RobiScreen()));
                      } else if (onTap == 'banglalink') {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BanglalinkScreen()));
                      } else if (onTap == 'teletalk') {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TeletalkScreen()));
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 12),
                      height: 100,
                      width: 140,
                      decoration: BoxDecoration(
                          color: boxColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: kIShadow),
                      child: Container(
                        margin: EdgeInsets.only(top: 60),
                        child: Column(
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
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
                      margin: EdgeInsets.only(top: 13),
                      alignment: Alignment.centerLeft,
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: boxColor,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: kIShadow),
                      child: Image(

                        image: AssetImage(image),
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
