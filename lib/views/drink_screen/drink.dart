import 'package:flutter/material.dart';
import 'package:rasha_conta/views/price_screen/price.dart';

var textEditingControllers = <TextEditingController>[];
List statesDrink = [];
var textFields = <TextField>[];

class Drink extends StatefulWidget {
  final int number;

  Drink({Key key, @required this.number}) : super(key: key);

  @override
  _DrinkState createState() => _DrinkState();
}

class _DrinkState extends State<Drink> {
  @override
  void initState() {
    statesDrink.clear();
    print(widget.number);
    for(var i=0; i<widget.number;i++){
      statesDrink.add(true);
    }
    print("size:" + statesDrink.length.toString());
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
                        child: Container(
                          child: RaisedButton(
                            onPressed: (){
                              setState(() {
                                statesDrink[index] = !statesDrink[index];
                              });
                            },
                            color: statesDrink[index] ? Color.fromRGBO(0, 195, 20, 0.45):Color.fromRGBO(244, 16, 16, 0.45),
                            child:Image.asset("assets/iconBeer.png"),
                          ),
                        ));
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Price(states: statesDrink,number: widget.number),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
