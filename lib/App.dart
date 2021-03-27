import 'package:flutter/material.dart';


class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  TextEditingController _inputGasPrice = TextEditingController();
  TextEditingController _inputAlcoholPrice = TextEditingController();
  String _txtResult = '';

  void _cleanInputs() {
    setState(() {
      _txtResult = "";
      _inputGasPrice.clear();
      _inputAlcoholPrice.clear();
    });
  }

  void _calc() {
    double _gasPrice      = double.tryParse(_inputGasPrice.text);
    double _alcoholPrice  = double.tryParse(_inputAlcoholPrice.text);
    String _resultMessage = '';

    if (_gasPrice == null || _alcoholPrice == null) {
      _resultMessage = 'Preço inválido!';
    } else {
      if(_alcoholPrice / _gasPrice >= 0.7) {
        _resultMessage = 'Abasteça com gasolina';
      } else {
        _resultMessage = 'Abasteça com álcool';
      }
    }

    setState(() {
      _txtResult = _resultMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Álcool x Gasolina'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset('images/logo.png'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
              child: Text("Saiba qual a melhor opção para abastecimento do "
                  "seu carro!",
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Preço da Gasolina (R\$)'
                ),
                style: TextStyle(
                  fontSize: 25,
                ),
                controller: _inputGasPrice,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Preço do Álcool (R\$)'
                ),
                style: TextStyle(
                  fontSize: 25,
                ),
                controller: _inputAlcoholPrice,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
              child: RaisedButton(
                onPressed: _calc,
                child: Text('CALCULAR',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                textColor: Colors.white,
                color: Colors.indigo,
                padding: EdgeInsets.all(15),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
              child: RaisedButton(
                onPressed: _cleanInputs,
                child: Text('LIMPAR',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                textColor: Colors.black54,
                color: Colors.white70,
                padding: EdgeInsets.all(15),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(_txtResult,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
