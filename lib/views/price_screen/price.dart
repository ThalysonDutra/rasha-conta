import 'package:flutter/material.dart';
import 'package:rasha_conta/views/result_screen/result.dart';

final priceText = TextEditingController();

class Price extends StatefulWidget {
  final states;
  final int number;

  Price({Key key, @required this.states, this.number}) : super(key: key);

  @override
  _PriceState createState() => _PriceState();
}

class _PriceState extends State<Price> {
  @override
  void initState() {
    priceText.text = "";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Informe o valor da conta...",
              style: TextStyle(fontSize: 24.0),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Padding(
                  padding:EdgeInsets.fromLTRB(80.0, 60.0,30.0,0.0),
                  child: Container(
                        width: MediaQuery.of(context).size.width*0.6,
                        height: 220,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(242, 242, 242, 1),
                          borderRadius: BorderRadius.all(Radius.circular(38.0)),
                        ),
                        child: Center(
                          child: TextField(
                            controller: priceText,
                            style: TextStyle(fontSize: 32),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                prefix: Text("R\$",style: TextStyle(fontSize: 20.0),),
                                hintText: "0.00"
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        )),

                )
              ],
            ),
          ),
      ]),
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
                        builder: (context) => Result(states: widget.states,number: widget.number, value: double.parse(priceText.text.replaceAll(",", "."))),
                      ),
                    );
                  },
                  color: Color.fromRGBO(105, 89, 205, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0)),
                  child: Text(
                    "Gerar Cotas",
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
