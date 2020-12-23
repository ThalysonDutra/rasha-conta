import 'dart:math';

import 'package:flutter/material.dart';

double cotaDrink;
double cotaNotDrink;

class Result extends StatefulWidget {
  final states;
  final int number;
  final value;

  Result({Key key, @required this.states, this.number, this.value}) : super(key: key);


  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {

  @override
  void initState() {
    calculate();
  }

  double roundDouble(double value, int places){
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  void calculate(){
      int numberDrink = 0;
      int numberNotDrink = 0;

      cotaDrink = 0.0;
      cotaNotDrink = 0.0;

      for(var i=0; i<widget.number;i++){
        if(widget.states[i]){
          print("Bebe");
          numberDrink++;
        }
        else{
          print("Não bebe");
          numberNotDrink++;
        }
      }

      cotaDrink = widget.value/(numberDrink+0.9*numberNotDrink);
      cotaNotDrink = 0.9*cotaDrink;

      print("cota not: ${roundDouble(cotaNotDrink, 2)}");
      print("cota2: ${roundDouble(cotaDrink,2)}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ra\$ha  Conta"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Assinale a quantidade  de amigos que bebem...",
              style: TextStyle(fontSize: 24.0),
              textAlign: TextAlign.center,
            ),
          ),
          SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.62,
                child: ListView.builder(
                    itemCount: widget.number,
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                    widget.states[index] ?"R\$ " + roundDouble(cotaDrink,2).toString():"R\$ " + roundDouble(cotaNotDrink,2).toString(),
                                  style: TextStyle(fontSize: 20.0),
                                )
                              ),
                              Container(
                                width: 20.0,
                              ),
                              Expanded(
                                child: Container(
                                  color: widget.states[index] ? Color.fromRGBO(0, 195, 20, 0.45):Color.fromRGBO(244, 16, 16, 0.45),
                                  child:Image.asset("assets/iconBeer.png"),
                                  height: 70.0,
                                ),
                              )
                            ],
                          )
                      );
                    }),
              )),
        ],
      ),
      bottomNavigationBar:BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                  },
                  color: Color.fromRGBO(105, 89, 205, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0)),
                  child: Text(
                    "Nova Conta",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
