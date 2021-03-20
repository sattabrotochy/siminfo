
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siminfoall/Model/Data_Model.dart';
import 'package:siminfoall/Provider/provider.dart';
import 'package:siminfoall/Widget/button_desgin.dart';
import 'package:siminfoall/Widget/offerbutton.dart';

class BanglalinkOfferScreen extends StatefulWidget {
  @override
  _BanglalinkOfferScreenState createState() => _BanglalinkOfferScreenState();
}

class _BanglalinkOfferScreenState extends State<BanglalinkOfferScreen> {


  List<DataModel> banglalinkOfferList=[];

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getbanglalinkOfferList();
    banglalinkOfferList=provider.throwbanglalinkOfferList;


    return Scaffold(
      backgroundColor: boxColor,
      body: ListView.builder(
          itemCount: banglalinkOfferList.length,
          itemBuilder: (context, index) {
            return buttonoffer(
              name: banglalinkOfferList[index].name,
              number: banglalinkOfferList[index].number,
              color: Colors.deepOrange,
              context: context,
            );
          }),
    );
  }
}

