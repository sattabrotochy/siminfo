
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siminfoall/Model/Data_Model.dart';
import 'package:siminfoall/Provider/provider.dart';
import 'package:siminfoall/Widget/button_desgin.dart';
import 'package:siminfoall/Widget/offerbutton.dart';


class AirtelOfferScreen extends StatefulWidget {
  @override
  _AirtelOfferScreenState createState() => _AirtelOfferScreenState();
}

class _AirtelOfferScreenState extends State<AirtelOfferScreen> {
  List<DataModel> airtelOfferList = [];

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getairtelOfferList();
    airtelOfferList = provider.throwairtelOfferList;
    return Scaffold(
      backgroundColor: boxColor,
      body: ListView.builder(
          itemCount: airtelOfferList.length,
          itemBuilder: (context, index) {
            return buttonoffer(
              name: airtelOfferList[index].name,
              number: airtelOfferList[index].number,
              color: Colors.red,
              context: context,
            );
          }),
    );
  }
}
