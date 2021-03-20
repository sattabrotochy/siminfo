
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siminfoall/Model/Data_Model.dart';
import 'package:siminfoall/Provider/provider.dart';
import 'package:siminfoall/Widget/button_desgin.dart';
import 'package:siminfoall/Widget/offerbutton.dart';

class TeletalkOfferScreen extends StatefulWidget {
  @override
  _TeletalkOfferScreenState createState() => _TeletalkOfferScreenState();
}

class _TeletalkOfferScreenState extends State<TeletalkOfferScreen> {


  List<DataModel> teletalkOfferList=[];


  @override
  Widget build(BuildContext context) {


    MyProvider provider = Provider.of<MyProvider>(context);


    provider.getteletalkOfferList();
    teletalkOfferList=provider.throwteletalkOfferList;



    return  Scaffold(
      backgroundColor: boxColor,
      body: ListView.builder(
          itemCount: teletalkOfferList.length,
          itemBuilder: (context, index) {
            return buttonoffer(
              name: teletalkOfferList[index].name,
              number: teletalkOfferList[index].number,
              color: Colors.green,
              context: context,
            );
          }),
    );
  }
}
