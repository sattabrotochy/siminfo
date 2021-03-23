import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:siminfoall/Model/Data_Model.dart';





class MyProvider extends ChangeNotifier{

/// gp all data get




  BuildContext context;
  List<DataModel> gpUSSDcodeList=[];
  DataModel _dataModel1;
  Future getGpUssdCode() async
  {

    List<DataModel> newgpUSSDcodeList=[];
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('Gp').doc('rDDWywna6gZBW6QsRNwA').collection('USSDCODE').get();
    querySnapshot.docs.forEach((element) {
      _dataModel1=DataModel(
        color: element.data()['color'],
        id: element.data()['id'],
        name: element.data()['name'],
        number: element.data()['number'],
      );
      newgpUSSDcodeList.add(_dataModel1);
      gpUSSDcodeList=newgpUSSDcodeList;
      notifyListeners();

    });

  }
  get throwGPUSSDCode{
    return gpUSSDcodeList;
  }



  /// gp internet

  List<DataModel> gpinternetList=[];
  DataModel dataModel2;

  Future getGpInternetList()async
  {
    List<DataModel> newgpinternetList=[];


    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('Gp').doc('rDDWywna6gZBW6QsRNwA').collection('internetOffer').get();
    querySnapshot.docs.forEach((element) {
      dataModel2=DataModel(
        color: element.data()['color'],
        id: element.data()['id'],
        name: element.data()['name'],
        number: element.data()['number'],
      );


      newgpinternetList.add(dataModel2);
      gpinternetList=newgpinternetList;
      notifyListeners();

    });


  }

  get throwgpInternetlist{
    return gpinternetList;
  }




  ///gp minute list



  List<DataModel> gpminuteList=[];
  DataModel dataModel3;

  Future getGpminuteList()async
  {

    List<DataModel> newgpminuteList=[];
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('Gp').doc('rDDWywna6gZBW6QsRNwA').collection('minuteOffer').get();
    querySnapshot.docs.forEach((element) {
      dataModel3=DataModel(
        color: element.data()['color'],
        id: element.data()['id'],
        name: element.data()['name'],
        number: element.data()['number'],
      );

      newgpminuteList.add(dataModel3);
      gpminuteList=newgpminuteList;

      notifyListeners();

    });

  }
  get throwgpminutelist{
    return gpminuteList;
  }



  /// aritel all data get




List<DataModel> airtelUSSDCODEList=[];
  DataModel _dataModel4;

  Future getAirtelUssdCode() async
  {

    List<DataModel> newairtelUSSDCODEList=[];
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('airtel').doc('UKLX5BFZKHEQuQ8lbgi3').collection('USSDCODE').get();
    querySnapshot.docs.forEach((element) {
      _dataModel4=DataModel(
        color: element.data()['color'],
        id: element.data()['id'],
        name: element.data()['name'],
        number: element.data()['number'],
      );

      newairtelUSSDCODEList.add(_dataModel4);
      airtelUSSDCODEList=newairtelUSSDCODEList;
      notifyListeners();

    });
  }
  get throwairtelUSSDCODE{
    return airtelUSSDCODEList;
  }


  /// airtel internet list

  List<DataModel> airtelinternetList=[];
  DataModel dataModel5;

  Future getAirtelInternetList()async
  {

    List<DataModel> newairtelinternetList=[];

    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('airtel').doc('UKLX5BFZKHEQuQ8lbgi3').collection('internetoffer').get();
    querySnapshot.docs.forEach((element) {
      dataModel5 =DataModel(
        color: element.data()['color'],
        id: element.data()['id'],
        name: element.data()['name'],
        number: element.data()['number'],
      );

      newairtelinternetList.add(dataModel5);
      airtelinternetList=newairtelinternetList;
      notifyListeners();

    });


  }

  get throwairtelinternetList {
    return airtelinternetList;
  }



  /// gp minute list


  List<DataModel> airtelminutelist =[];
  DataModel dataModel6 ;

  Future getAirtelminuteList()async
  {
    List<DataModel> newairtelminutelist =[];

    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('airtel').doc('UKLX5BFZKHEQuQ8lbgi3').collection('minuteoffer').get();
    querySnapshot.docs.forEach((element) {
      dataModel6 =DataModel(
        color: element.data()['color'],
        id: element.data()['id'],
        name: element.data()['name'],
        number: element.data()['number'],
      );

      newairtelminutelist.add(dataModel6);
      airtelminutelist=newairtelminutelist;

      notifyListeners();

    });


  }

  get  throwairtelminutelist {
    return airtelminutelist;
  }





  ///banglalink data get

  List<DataModel> banglaUSSDCODElist=[];
  DataModel dataModel7;

  Future getBanglalinkUSSDcode()async{
    List<DataModel> newbanglaUSSDCODElist=[];

    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('banglalink').doc('mfS6iCVcXQn6fUTbokTA').collection('USSDCODE').get();
    querySnapshot.docs.forEach((element) {
      dataModel7=DataModel(
        color: element.data()['color'],
        id: element.data()['id'],
        name: element.data()['name'],
        number: element.data()['number'],
      );
      newbanglaUSSDCODElist.add(dataModel7);
      banglaUSSDCODElist=newbanglaUSSDCODElist;
      notifyListeners();
    });
  }
  get ThrowBnaglalinkUSSDCode{
    return banglaUSSDCODElist;
  }

  /// get banglalink internet





  List<DataModel> banglalinkinternetlist=[];
  DataModel dataModel8;


  Future getBanglalinkinternetlist()async{
    List<DataModel> newbanglainternetlist=[];

    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('banglalink').doc('mfS6iCVcXQn6fUTbokTA').collection('internetoffer').get();
    querySnapshot.docs.forEach((element) {
      dataModel8=DataModel(
        color: element.data()['color'],
        id: element.data()['id'],
        name: element.data()['name'],
        number: element.data()['number'],
      );
      newbanglainternetlist.add(dataModel8);
      banglalinkinternetlist=newbanglainternetlist;
      notifyListeners();
    });
  }
  get ThrowBnaglalinkinternetlist{
    return banglalinkinternetlist;
  }



///banglalink minute list


  List<DataModel> banglalinkminutelist=[];
  DataModel dataModel9;


  Future getbanglalinkminutelist()async{
    List<DataModel> newbanglalinkminutelist =[];

    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('banglalink').doc('mfS6iCVcXQn6fUTbokTA').collection('minuteoffer').get();
    querySnapshot.docs.forEach((element) {
      dataModel9=DataModel(
        color: element.data()['color'],
        id: element.data()['id'],
        name: element.data()['name'],
        number: element.data()['number'],
      );
      newbanglalinkminutelist.add(dataModel9);
      banglalinkminutelist=newbanglalinkminutelist;
      notifyListeners();
    });
  }
  get throwbanglalinkminutelist{
    return banglalinkminutelist;
  }





  /// robi data get


  List<DataModel> robiUSSDCodeList=[];
  DataModel dataModel10;

  Future getRobiUssdCode() async
  {

    List<DataModel> newrobiUSSDCodeList=[];
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('robi').doc('rbMFsa1SuF3SnNijOeh7').collection('USSDCODE').get();
    querySnapshot.docs.forEach((element) {
      dataModel10=DataModel(
        color: element.data()['color'],
        id: element.data()['id'],
        name: element.data()['name'],
        number: element.data()['number'],
      );

      newrobiUSSDCodeList.add(dataModel10);
      robiUSSDCodeList=newrobiUSSDCodeList;
      notifyListeners();

    });
  }

  get throwRobiUSSDCode{
    return robiUSSDCodeList;
  }

  /// robi internet list


  List<DataModel> robiInternetList=[];
  DataModel dataModel11;

  Future getrobiInternetList() async
  {

    List<DataModel> newrobiInternetList =[];
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('robi').doc('rbMFsa1SuF3SnNijOeh7').collection('internetoffer').get();
    querySnapshot.docs.forEach((element) {
     dataModel11 =DataModel(
        color: element.data()['color'],
        id: element.data()['id'],
        name: element.data()['name'],
        number: element.data()['number'],
      );

      newrobiInternetList.add(dataModel11);
     robiInternetList=newrobiInternetList;
      notifyListeners();

    });
  }

  get throwrobiInternetList{
    return robiInternetList;
  }



/// robi minute list


  List<DataModel> robiminutelist=[];
  DataModel dataModel12;

  Future getrobiminutelist() async
  {

    List<DataModel>  newrobiminutelist=[];
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('robi').doc('rbMFsa1SuF3SnNijOeh7').collection('minuteoffer').get();
    querySnapshot.docs.forEach((element) {
       dataModel12=DataModel(
        color: element.data()['color'],
        id: element.data()['id'],
        name: element.data()['name'],
        number: element.data()['number'],
      );

      newrobiminutelist.add(dataModel12);
       robiminutelist=newrobiminutelist;
      notifyListeners();

    });
  }

  get throwrobiminutelist{
    return robiminutelist;
  }











  /// teletalk get data

  List<DataModel> teletalkUSSDCODList= [];
  DataModel dataModel13;

  Future getTeletalkUSSDcode()async
  {

    List<DataModel> newteletalkUSSDCODList=[];
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('teletalk').doc('tKsrVWOai1qmUhndQrLU').collection('USSDCODE').get();
    querySnapshot.docs.forEach((element) {
      dataModel13=DataModel(
        color: element.data()['color'],
        id: element.data()['id'],
        name: element.data()['name'],
        number: element.data()['number'],
      );

      newteletalkUSSDCODList.add(dataModel13);
      teletalkUSSDCODList=newteletalkUSSDCODList;
      notifyListeners();
    });

  }
  get throwTeletalkUSSDCode{
    return teletalkUSSDCODList;
  }

  ///teletalk internet list


  List<DataModel> teletalkinternetlist= [];
  DataModel dataModel14 ;

  Future getteletalkinternetlist()async
  {

    List<DataModel> newteletalkinternetlist =[];
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('teletalk').doc('tKsrVWOai1qmUhndQrLU').collection('internetoffer').get();
    querySnapshot.docs.forEach((element) {
      dataModel14=DataModel(
        color: element.data()['color'],
        id: element.data()['id'],
        name: element.data()['name'],
        number: element.data()['number'],
      );

      newteletalkinternetlist.add(dataModel14);
      teletalkinternetlist=newteletalkinternetlist;
      notifyListeners();
    });

  }
  get throwteletalkinternetlist{
    return teletalkinternetlist;
  }



  ///teletalk minute list


  List<DataModel> teletalkminuteList= [];
  DataModel  dataModel15;

  Future getteletalkminuteList()async
  {

    List<DataModel> newteletalkminuteList =[];
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('teletalk').doc('tKsrVWOai1qmUhndQrLU').collection('minuteoffer').get();
    querySnapshot.docs.forEach((element) {
     dataModel15 =DataModel(
        color: element.data()['color'],
        id: element.data()['id'],
        name: element.data()['name'],
        number: element.data()['number'],
      );

      newteletalkminuteList.add(dataModel15);
     teletalkminuteList=newteletalkminuteList;
      notifyListeners();
    });

  }
  get throwteletalkminuteList{
    return teletalkminuteList;
  }




  /// new gp offer list


  List<DataModel> gpOfferLis= [];
  DataModel dataModel16 ;

  Future getgpOfferLis()async
  {

    List<DataModel> newgpOfferLis =[];
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('Gp').doc('rDDWywna6gZBW6QsRNwA').collection('newoffergp').get();
    querySnapshot.docs.forEach((element) {
       dataModel16=DataModel(
        color: element.data()['color'],
        id: element.data()['id'],
        name: element.data()['name'],
        number: element.data()['number'],
      );

      newgpOfferLis.add(dataModel16);
       gpOfferLis =newgpOfferLis;
      notifyListeners();
    });

  }
  get  throwgpOfferLis{
    return gpOfferLis;
  }

  ///  airtel offer list


  List<DataModel> airtelOfferList= [];
  DataModel  dataModel17;

  Future  getairtelOfferList()async
  {

    List<DataModel> newairtelOfferList =[];
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('airtel').doc('UKLX5BFZKHEQuQ8lbgi3').collection('newofferairtel').get();
    querySnapshot.docs.forEach((element) {
     dataModel17 =DataModel(
        color: element.data()['color'],
        id: element.data()['id'],
        name: element.data()['name'],
        number: element.data()['number'],
      );

      newairtelOfferList.add(dataModel17);
     airtelOfferList=newairtelOfferList;
      notifyListeners();
    });

  }
  get throwairtelOfferList {
    return airtelOfferList;
  }

  /// banglalink offer list




  List<DataModel> banglalinkOfferList= [];
  DataModel dataModel18 ;

  Future  getbanglalinkOfferList()async
  {

    List<DataModel>  newbanglalinkOfferList=[];
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('banglalink').doc('mfS6iCVcXQn6fUTbokTA').collection('newofferbangalink').get();
    querySnapshot.docs.forEach((element) {
       dataModel18=DataModel(
        color: element.data()['color'],
        id: element.data()['id'],
        name: element.data()['name'],
        number: element.data()['number'],
      );

      newbanglalinkOfferList.add(dataModel18);
       banglalinkOfferList =newbanglalinkOfferList;
      notifyListeners();
    });

  }
  get  throwbanglalinkOfferList{
    return banglalinkOfferList;
  }

/// robi offer list


  List<DataModel> robiOfferList= [];
  DataModel  dataModel19;

  Future  getrobiOfferList()async
  {

    List<DataModel>  newrobiOfferList=[];
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('robi').doc('rbMFsa1SuF3SnNijOeh7').collection('newrobioffer').get();
    querySnapshot.docs.forEach((element) {
      dataModel19=DataModel(
        color: element.data()['color'],
        id: element.data()['id'],
        name: element.data()['name'],
        number: element.data()['number'],
      );

      newrobiOfferList.add(dataModel19);
      robiOfferList =newrobiOfferList;
      notifyListeners();
    });

  }
  get throwrobiOfferList {
    return robiOfferList;
  }


  /// teletalk offer list

  List<DataModel> teletalkOfferList= [];
  DataModel  dataModel20;

  Future getteletalkOfferList ()async
  {

    List<DataModel> newteletalkOfferList =[];
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('teletalk').doc('tKsrVWOai1qmUhndQrLU').collection('newteletalkoffer').get();
    querySnapshot.docs.forEach((element) {
      dataModel20=DataModel(
        color: element.data()['color'],
        id: element.data()['id'],
        name: element.data()['name'],
        number: element.data()['number'],
      );

      newteletalkOfferList.add(dataModel20);
      teletalkOfferList =newteletalkOfferList;
      notifyListeners();
    });

  }
  get  throwteletalkOfferList{
    return teletalkOfferList;
  }



}

