import 'package:flutter/material.dart';

Widget buttonoffer(
    {String name, String number, Color color, BuildContext context}) {
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
                child: Container(
                  width: 160,
                  child: Text(
                    name,
                    maxLines: 1,
                    style: TextStyle(fontSize: 17),
                  ),
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
                      color: color,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(13),
                        bottomRight: Radius.circular(13),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        showDialogFunc(context, name);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 60),
                        child: Center(
                          child: Image(
                            height: 40,
                            width: 40,
                            image: AssetImage('asset/surprise.png'),
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
            child: Center(
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
        ),
      );
    },
  );
}
