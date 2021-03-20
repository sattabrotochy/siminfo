
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siminfoall/Model/Data_Model.dart';
import 'package:siminfoall/Provider/provider.dart';
import 'package:siminfoall/Widget/button_desgin.dart';
import 'package:siminfoall/Widget/offerbutton.dart';


class RobiOfferScreen extends StatefulWidget {
  @override
  _RobiOfferScreenState createState() => _RobiOfferScreenState();
}

class _RobiOfferScreenState extends State<RobiOfferScreen> {

  List<DataModel> robiOfferList=[];


  @override
  Widget build(BuildContext context) {

    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getrobiOfferList();
    robiOfferList=provider.throwrobiOfferList;

    return Scaffold(
      backgroundColor: boxColor,
      body: ListView.builder(
          itemCount: robiOfferList.length,
          itemBuilder: (context, index) {
            return buttonoffer(
              name: robiOfferList[index].name,
              number: robiOfferList[index].number,
              color: Colors.pink,
              context: context,
            );
          }),
    );
  }
}
