import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_card_scanner_latest/flutter_card_scanner_latest.dart';
import 'CardScanResponse.dart';
import 'Constant.dart';
/*Example class which demonstrates
the use of the plugin*/

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String cardScanResponse = '';

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initCardScan() async {
    String scanResponse='';
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      String response = await FlutterCardScannerLatest.scanCard;
      //Parsing the response
      final CardScanResponse cardScanResponse =
      CardScanResponse.fromJSON(json.decode(response));
      //Reading the response and rendering it on the screen
      if (cardScanResponse.result == Constant.success) {
        scanResponse = cardScanResponse.responseText +
            '\n' +
            'Cardholder\'s Name : ' +
            cardScanResponse.body.cardholderName + '\n' +
            'Expiry : ' +
            cardScanResponse.body.expiry;
      } else {
        scanResponse = cardScanResponse.responseText;
      }
    } on PlatformException catch (e) {
      scanResponse = "Failed to scan the card ::: '${e.message}'.";
    }

    setState(() {
      cardScanResponse = scanResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
        title: Text("Card Scanner"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: new TextSpan(
                style: new TextStyle(
                  fontSize: 20.0,
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  new TextSpan(
                      text: cardScanResponse,
                      style: new TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation : FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: initCardScan,
        tooltip: 'Scan Card',
        elevation: 50.0,
        child: Icon(Icons.scanner),
      ),
    ),
    );
  }
}
