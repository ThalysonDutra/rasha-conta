import 'package:flutter/material.dart';
import 'package:rasha_conta/views/drink_screen/drink.dart';

int numberOfFriends = 2;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ra\$ha  Conta"),
        centerTitle: true,
      ),
      body: Column(children: [
        Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Olá, bem-vindo ao Ra\$ha Conta!",
              style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Informe a quantidade de  pessoas...",
            style: TextStyle(fontSize: 24.0),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(40.0, 20.0, 5.0, 0.0),
                  child: Container(
                    width: 60.0,
                    height: 220.0,
                    child: RaisedButton(
                      onPressed: numberOfFriends == 2
                          ? null
                          : () {
                              setState(() {
                                numberOfFriends--;
                              });
                            },
                      color: Color.fromRGBO(161, 0, 0, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11.0)),
                      child: Text(
                        "-",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 5.0, 0.0),
                child: Container(
                    width: 220,
                    height: 220,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(242, 242, 242, 1),
                      borderRadius: BorderRadius.all(Radius.circular(38.0)),
                    ),
                    child: Center(
                      child: Text(numberOfFriends.toString(),
                          style: TextStyle(fontSize: 32.0),
                          textAlign: TextAlign.center),
                    )),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 5.0, 0.0),
                  child: Container(
                    width: 60.0,
                    height: 220.0,
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          numberOfFriends++;
                        });
                      },
                      color: Color.fromRGBO(0, 195, 20, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11.0)),
                      child: Text(
                        "+",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
          child: Row(children: [
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(10.0),
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Drink(number: numberOfFriends),
                ),
              );
            },
            color: Color.fromRGBO(105, 89, 205, 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11.0)),
            child: Text(
              "Continuar",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ))
      ])),
    );
  }
}
